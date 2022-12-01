output "alb_dns_name" {
  description = "ALB front domain name"
  value       = aws_lb.example.dns_name
}