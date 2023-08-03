<?php
$servername = "localhost";
$username = "root";
$password_db = "";
$dbname = "dblogin";

$conn = new mysqli($servername, $username, $password_db, $dbname);

// Comprobar si la conexión fue exitosa
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}
?>
