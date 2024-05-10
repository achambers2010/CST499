<?php
session_start();
require_once 'DBHandler.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: /login.php");
    exit;
}

$db = new DBHandler();
$user_id = $_SESSION['user_id'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class Calendar</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#semesterSelect').change(function() {
                loadCourses($(this).val());
            });

            $(document).on('submit', 'form', function(e) {
                e.preventDefault();
                var form = $(this);
                $.ajax({
                    url: form.attr('action'),
                    method: 'POST',
                    data: form.serialize(),
                    success: function(response) {
                        //alert(response); // You can replace this with a more sophisticated feedback
                        loadCourses($('#semesterSelect').val());
                    }
                });
            });
        });

        function loadCourses(semester) {
            $.ajax({
                url: 'fetch_courses.php', // This should point to a PHP file that fetches courses based on the semester
                method: 'GET',
                data: {semester: semester},
                success: function(data) {
                    $('#courseList').html(data);
                }
            });
        }
    </script>
</head>
<?php require 'master.php';?>
<body>
    <h1>Class Calendar</h1>
    <select id="semesterSelect">
        <option value=""></option>
        <option value="Spring">Spring</option>
        <option value="Fall">Fall</option>
        <option value="Winter">Winter</option>
    </select>
    <ul id="courseList">
        <!-- Courses will be loaded here based on the selected term -->
    </ul>
</body>
</html>
