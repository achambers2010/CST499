<?php
session_start();
require_once 'DBHandler.php';
$db = new DBHandler();

// Redirect if not logged in
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header('Location: login.php');
    exit;
}

// Fetch courses and their availability and waitlist status
$courses = $db->executeSelectQuery("
    SELECT c.course_id, c.course_name, c.max_enrollment,
           (SELECT COUNT(*) FROM enrollment_table WHERE course_id = c.course_id) AS enrolled,
           (SELECT COUNT(*) FROM waitlist_table WHERE course_id = c.course_id) AS waitlisted
    FROM courses_table c
");

// Check if the form has been submitted
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['course_id'])) {
    $course_id = $_POST['course_id'];
    $user_id = $_SESSION['user_id']; // Assuming user_id is stored in session

    // Check course capacity and current enrollment
    $course_details = $db->executeSelectQuery("SELECT max_enrollment FROM courses_table WHERE course_id = ?", [$course_id]);
    if (empty($course_details)) {
        $error_msg = "Course not found. ID: " . htmlspecialchars($course_id);
    } else {
        $max_enrollment = $course_details[0]['max_enrollment'];
        $current_enrollment = $db->executeSelectQuery("SELECT COUNT(*) as count FROM enrollment_table WHERE course_id = ?", [$course_id])[0]['count'];
        $current_waitlist = $db->executeSelectQuery("SELECT COUNT(*) as count FROM waitlist_table WHERE course_id = ?", [$course_id])[0]['count'];

        // Check if user is already enrolled or waitlisted
        $already_enrolled = $db->executeSelectQuery("SELECT * FROM enrollment_table WHERE user_id = ? AND course_id = ?", [$user_id, $course_id]);
        $already_waitlisted = $db->executeSelectQuery("SELECT * FROM waitlist_table WHERE user_id = ? AND course_id = ?", [$user_id, $course_id]);

        if (!empty($already_enrolled)) {
            $error_msg = "You are already enrolled in this course.";
        } elseif (!empty($already_waitlisted)) {
            $error_msg = "You are already on the waitlist for this course.";
        } else {
            if ($current_enrollment < $max_enrollment) {
                // Enroll user
                $insertSQL = "INSERT INTO enrollment_table (user_id, course_id, status, enroll_date) VALUES (?, ?, 'enrolled', NOW())";
                $db->executeQuery($insertSQL, [$user_id, $course_id]);
                $success_msg = "Successfully enrolled in the course!";
            } else {
                // Add to waitlist
                $insertSQL = "INSERT INTO waitlist_table (user_id, course_id, position, added_date) VALUES (?, ?, ?, NOW())";
                $db->executeQuery($insertSQL, [$user_id, $course_id, $current_waitlist + 1]);
                $success_msg = "No spots left, you have been added to the waitlist.";
            }
        }
    }
}

?>