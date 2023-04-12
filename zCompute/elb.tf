# create security group for load balance
# configure for ingress, only 80/HTTP service traffic allowed
resource "aws_security_group" "lb_sg_kdh" {
  name   = var.lb_sg_name
  vpc_id = aws_vpc.vpc1_kdh.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# create load balance for handle external traffic 
resource "aws_lb" "lb_kdh" {
  name               = var.lb_name
  load_balancer_type = "application"
  internal           = false
  subnets            = [aws_subnet.public_subnet1.id]
  security_groups    = [aws_security_group.lb_sg_kdh.id]
}

# create load balance target group
# configure target's health-check schema to check connection & service status
resource "aws_lb_target_group" "lb_tg_kdh" {
  name        = var.lb_tg_name
  vpc_id      = aws_vpc.vpc1_kdh.id
  port        = 80
  protocol    = var.protocol_HTTP
  target_type = "instance"
  health_check {
    path = "/"
  }
}

# attach load balance target group to actual target themself
# it only attached published instance for secure matter
resource "aws_lb_target_group_attachment" "lb_tg_attachment" {
  target_group_arn = aws_lb_target_group.lb_tg_kdh.arn
  target_id        = aws_instance.vm1.id
  port             = 80
}

# create load balance listener to define which traffic adjusting to
resource "aws_lb_listener" "lb_listener_kdh" {
  load_balancer_arn = aws_lb.lb_kdh.arn
  port              = 80
  protocol          = var.protocol_HTTP
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.lb_tg_kdh.arn
  }
}