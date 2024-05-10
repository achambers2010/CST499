<?php
session_start();
require_once 'DBHandler.php';
if (!isset($_SESSION['user_id']) || !isset($_GET['semester'])) {
    echo "Invalid request";
    exit;
}

$db = new DBHandler();
$user_id = $_SESSION['user_id'];
$semester = $_GET['semester'];

// Fetch all relevant courses for the semester along with enrollment counts
$all_courses = $db->executeSelectQuery("
    SELECT c.course_id, c.course_name, c.description, c.semester_offered, c.max_enrollment, 
           IFNULL(COUNT(e.user_id), 0) AS current_enrollment
    FROM courses_table c
    LEFT JOIN enrollment_table e ON c.course_id = e.course_id AND e.course_id IN (
        SELECT course_id FROM enrollment_table GROUP BY course_id
    )
    WHERE c.semester_offered = ?
    GROUP BY c.course_id
    ORDER BY c.course_name", [$semester]);

$enrolledCourseIds = array_column($db->executeSelectQuery("SELECT course_id FROM enrollment_table WHERE user_id = ?", [$user_id]), 'course_id');
$waitlistedCourseIds = array_column($db->executeSelectQuery("SELECT course_id FROM waitlist_table WHERE user_id = ?", [$user_id]), 'course_id');

foreach ($all_courses as $course) {
    $canEnroll = $course['max_enrollment'] > $course['current_enrollment'];
    echo '<li>';
    echo htmlspecialchars($course['course_name']) . ' - ' . htmlspecialchars($course['description']);
    echo ' (' . htmlspecialchars($course['semester_offered']) . ', Enrolled: ' . $course['current_enrollment'] . '/' . $course['max_enrollment'] . ')';
    if (in_array($course['course_id'], $enrolledCourseIds)) {
        echo '<form method="post" action="unenroll.php">
                <input type="hidden" name="course_id" value="' . $course['course_id'] . '">
                <button type="submit">Unenroll</button>
              </form>';
    } elseif (in_array($course['course_id'], $waitlistedCourseIds)) {
        echo '<form method="post" action="cancel_waitlist.php">
                <input type="hidden" name="course_id" value="' . $course['course_id'] . '">
                <button type="submit">Cancel Waitlist</button>
              </form>';
    } else if ($canEnroll) {
        echo '<form method="post" action="enroll.php">
                <input type="hidden" name="course_id" value="' . $course['course_id'] . '">
                <button type="submit">Enroll</button>
              </form>';
    }
    echo '</li>';
}
?>
