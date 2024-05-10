<?php
session_start();
require_once 'DBHandler.php';
$db = new DBHandler();

if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header('Location: login.php');
    exit;
}

$user_id = $_SESSION['user_id']; // Assuming user_id is stored in session

// Fetch courses for unenrollment and waitlist removal
$courses = $db->executeSelectQuery("
    SELECT c.course_id, c.course_name, 'Enrolled' as status
    FROM enrollment_table e
    JOIN courses_table c ON e.course_id = c.course_id
    WHERE e.user_id = ?
    UNION
    SELECT c.course_id, c.course_name, 'Waitlisted' as status
    FROM waitlist_table w
    JOIN courses_table c ON w.course_id = c.course_id
    WHERE w.user_id = ?
", [$user_id, $user_id]);

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['course_id'])) {
    $course_id = $_POST['course_id'];

    // Determine if the user is enrolled or waitlisted
    foreach ($courses as $course) {
        if ($course['course_id'] == $course_id) {
            if ($course['status'] === 'Enrolled') {
                // Unenroll user
                $db->executeQuery("DELETE FROM enrollment_table WHERE user_id = ? AND course_id = ?", [$user_id, $course_id]);
                $success_msg = "Successfully unenrolled from the course.";
            } elseif ($course['status'] === 'Waitlisted') {
                // Remove from waitlist
                $db->executeQuery("DELETE FROM waitlist_table WHERE user_id = ? AND course_id = ?", [$user_id, $course_id]);
                $success_msg = "Successfully removed from the waitlist.";
            }
            break;
        }
    }
}

?>
