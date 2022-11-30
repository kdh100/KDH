provider "aws" {
  region  = "us-east-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

# 1. AWS Launch Configuration
# * Web Server
# * Security Group
resource "aws_launch_configuration" "example" {
  name          = "example_instance"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  user_data = <<-EOF
    #!/bin/bash
    echo "My Web Server" > index.html
    nohup busybox httpd -f -p 8080 &
  EOF

  lifecycle {
    create_before_destroy = true
  }
}

# 2. Autoscaling Group
resource "aws_autoscaling_group" "bar" {
  name                      = "example_asg"
  max_size                  = 10
  min_size                  = 2
  health_check_type         = "ELB"

  launch_configuration      = aws_launch_configuration.example.name
  vpc_zone_identifier       = data.aws_subnets.default.ids
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc.id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_vpc" "default" {
  default = true
}