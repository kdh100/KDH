output "instance_public_dns" {
  value = aws_instance.kdh_instance.public_dns
}

output "instance_public_ip" {
  value = "ssh -i ~/.ssh/kdhkey ubuntu@${aws_instance.kdh_instance.public_ip}"
}