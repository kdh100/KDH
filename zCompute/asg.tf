# create launch template
# aws document said 'launch configuration' is no longer supported for ec2
# https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-configurations.html
resource "aws_launch_template" "lg_kdh" {
  name_prefix = var.launch_template_name
  image_id = var.image_ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg1_kdh.id]
  lifecycle {
    create_before_destroy = true
  }
}

# create autoscaling group
# configure checking health to elb and launch new instances into public subnet
resource "aws_autoscaling_group" "asg1_kdh" {
  name = var.autoscaling_group_name
  min_size = 1
  max_size = 3
  health_check_type = "ELB"
  health_check_grace_period = 300
  vpc_zone_identifier = [aws_subnet.public_subnet1.id]
  launch_template {
    id = aws_launch_template.lg_kdh.id
    version = "$Latest"
  }
  lifecycle {
    create_before_destroy = true
  }
}

# define autoscaling policy to tracking target's cpu average about 20%
resource "aws_autoscaling_policy" "asg_policy_kdh" {
  name = "asg_policy_kdh"
  policy_type = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.asg1_kdh.name
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 25.0
  }
}