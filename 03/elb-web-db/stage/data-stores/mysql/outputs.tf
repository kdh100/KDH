output "port" {
  description = "MySQL DB Port"
  value       = aws_db_instance.example.port
}

output "address" {
  description = "MySQL DB address"
  value       = aws_db_instance.example.address
}