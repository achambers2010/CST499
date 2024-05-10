<?php
session_start();
require_once 'DBHandler.php';
if (!isset($_SESSION['user_id'])) {
    header("Location: /login.php");
    exit;
}
$db = new DBHandler();
$user_id = $_SESSION['user_id'];
$user = $db->executeSelectQuery("SELECT username, email, full_name, address, phone_number FROM users_table WHERE user_id = ?", [$user_id])[0];

// Fetch enrolled courses
$enrolled_courses = $db->executeSelectQuery("
    SELECT c.course_id, c.course_name, 'Enrolled' as status
    FROM enrollment_table e
    JOIN courses_table c ON e.course_id = c.course_id
    WHERE e.user_id = ?
", [$user_id]);

// Fetch waitlisted courses and user position
$waitlisted_courses = $db->executeSelectQuery("
    SELECT c.course_id, c.course_name, 'Waitlisted' as status, w.position
    FROM waitlist_table w
    JOIN courses_table c ON w.course_id = c.course_id
    WHERE w.user_id = ?
", [$user_id]);

// Determine if user is next in line for any course they are waitlisted for
$next_in_line_courses = [];
foreach ($waitlisted_courses as $course) {
    $is_next = $db->executeSelectQuery("
        SELECT EXISTS (
            SELECT 1 FROM waitlist_table
            WHERE course_id = ? AND position < ?
        ) as is_not_first", [$course['course_id'], $course['position']]
    )[0]['is_not_first'] == 0; // Check if no one has a lower position number

    if ($is_next) {
        $next_in_line_courses[] = $course['course_id'];
    }
}

$all_courses = array_merge($enrolled_courses, $waitlisted_courses);
?>
<!DOCTYPE html>
<html lang="en">
<head>
<?php require 'master.php';?>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <style>
        .container {
            display: flex;
            justify-content: space-between;
        }
        .column {
            flex: 1;
            padding: 10px;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            padding: 5px 0;
        }
        .status-enrolled {
            color: green;
        }
        .open-spot {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="column">
            <h2>User Profile</h2>
            <p>Username: <?= htmlspecialchars($user['username']) ?></p>
            <p>Email: <?= htmlspecialchars($user['email']) ?></p>
            <p>Full Name: <?= htmlspecialchars($user['full_name']) ?></p>
            <p>Address: <?= htmlspecialchars($user['address']) ?></p>
            <p>Phone Number: <?= htmlspecialchars($user['phone_number']) ?></p>
        </div>
        <div class="column">
            <h2>Enrolled/Waitlisted Courses</h2>
            <ul>
                <?php foreach ($all_courses as $course): ?>
                    <li class="<?= $course['status'] === 'Enrolled' ? 'status-enrolled' : 'status-waitlisted'; ?>">
                        <?= htmlspecialchars($course['course_id']) ?> - <?= htmlspecialchars($course['course_name']) ?> - <?= htmlspecialchars($course['status']) ?>
                        <?php if (in_array($course['course_id'], $next_in_line_courses)): ?>
                            - <span class="open-spot">You may now enroll!</span>
                        <?php endif; ?>
                    </li>
                <?php endforeach; ?>
            </ul>
        </div>
    </div>
</body>
</html>
