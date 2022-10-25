<?php
$servername = "apm_to_docker-compose-master-mysql-1";
$username = "root";
$password = "password";
$dbname = "mydb";

// create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

// check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

// sql table to insert data
$sql = "INSERT INTO Myguest (firstname, lastname, email)
VALUES ('dongha', 'kim', 'vataltrick@gmail.com')";

if (mysqli_query($conn, $sql)) {
  echo "New data recorded successfully";
} else {
  echo "Error: " .$sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);
?>
