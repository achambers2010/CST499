<?php
require_once 'DBHandler.php';
$db = new DBHandler();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $full_name = $_POST['full_name'];
    $address = $_POST['address'];
    $phone_number = $_POST['phone_number'];

    // Check if username exists
    $sql = "SELECT username FROM users_table WHERE username = ?";
    $userExists = $db->executeSelectQuery($sql, [$username]);

    if (count($userExists) > 0) {
        echo "Error: Username already exists!";
    } else {
        $sql = "INSERT INTO users_table (username, email, password_hash, full_name, address, phone_number, created_at) VALUES (?, ?, ?, ?, ?, ?, NOW())";
        $db->executeQuery($sql, [$username, $email, $password, $full_name, $address, $phone_number]);
        echo "Registration successful!";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
</head>
<?php require 'master.php';?>
<body>
    <h1>Register</h1>
    <form method="post">
        Username: <input type="text" name="username" required><br>
        Email: <input type="email" name="email" required><br>
        Password: <input type="password" name="password" required><br>
        Full Name: <input type="text" name="full_name" required><br>
        Address: <input type="text" name="address" required><br>
        Phone Number: <input type="text" name="phone_number" required><br>
        <button type="submit">Register</button>
    </form>
</body>
</html>
