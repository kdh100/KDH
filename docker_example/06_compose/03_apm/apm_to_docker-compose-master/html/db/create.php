<?php
$servername = "apm_to_docker-compose-master-mysql-1";
$username = "root";
$password = "password";

// create connection
$conn = mysqli_connect($servername, $username, $password);

// check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

// create database
$sql = "CREATE DATABASE urdb";
if (mysqli_query($conn, $sql)) {
  echo "Database created successfully";
} else {
  echo "Error creating database: " . mysqli_error($conn);
}

mysqli_close($conn);
?>
