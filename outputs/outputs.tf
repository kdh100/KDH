output "public_ip" {
  description = "The public IP address of the Instance"
  value       = aws_instance.example.public_ip
}