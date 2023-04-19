#Load Balancer 만들기
resource "aws_alb" "tf_alb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public_subnet.id]
  security_groups    = [aws_security_group.alb_sg.id]


  tags = {
    Name = "test-alb"
  }
}


resource "aws_lb_target_group" "tf_alb_tg" {
  name        = "alb-tg"
  port               = 80
  protocol           = "HTTP"
  target_type        = "instance"
  vpc_id             = aws_vpc.lab-vpc.id

  health_check {
    path = "/"
  }
}


# Taget Group이 인스턴스 감지하게 하기
resource "aws_lb_target_group_attachment" "web_tg_attachment0" {

  target_group_arn = aws_lb_target_group.tf_alb_tg.arn
  target_id = aws_instance.web-server0.id

  port             = 80
}

# Taget Group이 인스턴스 감지하게 하기
resource "aws_lb_target_group_attachment" "web_tg_attachment1" {

  target_group_arn = aws_lb_target_group.tf_alb_tg.arn
  target_id = aws_instance.web-server1.id

  port             = 80
}

resource "aws_lb_listener" "tf_alb_listener" {
  load_balancer_arn  = aws_alb.tf_alb.arn
  port               = "80"
  protocol           = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.tf_alb_tg.arn
    type             = "forward"
  }
}


resource "aws_security_group" "alb_sg" {
  name = "tf-alb-sg"
  vpc_id = aws_vpc.lab-vpc.id
  
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



