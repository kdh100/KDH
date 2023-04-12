# create launch configuration
resource "aws_launch_configuration" "lg_kdh" {
  name            = var.launch_configuration_name
  image_id        = var.image_ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.fe_sg_kdh.id]
  lifecycle {
    create_before_destroy = true
  }
}

# create autoscaling group
resource "aws_autoscaling_group" "asg1_kdh" {
  name                      = var.autoscaling_group_name
  launch_configuration      = aws_launch_configuration.lg_kdh.name
  min_size                  = 1
  max_size                  = 3
  vpc_zone_identifier = [aws_subnet.public_subnet1.id]
  lifecycle {
    create_before_destroy = true
  }
}

# define autoscaling policy to tracking target's cpu average about 25%
resource "aws_autoscaling_policy" "asg_policy_kdh" {
  name                   = var.autoscaling_policy_name
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.asg1_kdh.name
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 25.0
  }
}