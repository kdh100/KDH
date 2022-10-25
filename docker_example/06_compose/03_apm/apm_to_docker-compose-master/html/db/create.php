<?php
$servername = "apm_to_docker-compose-master-mysql-1";
$username = "soldesk";
$password = "soldesk1.";

$conn = mysqli_connect($servername, $username, $password);

if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}
echo "Connection successfully";
?>
