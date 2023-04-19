resource "aws_launch_configuration" "test_lc" {
    name = "TEST_LC"
    image_id = var.image_ami
    instance_type = var.web_servers_type

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_autoscaling_group" "test_asg" {
    name = "TEST_ASG"
    launch_configuration = aws_launch_configuration.test_lc.name
    min_size = 1
    max_size = 3

    vpc_zone_identifier = [aws_subnet.private_subnet.id]

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_autoscaling_policy" "example" {
    name = "test-asg_policy"
    policy_type = "TargetTrackingScaling"
    autoscaling_group_name  = aws_autoscaling_group.test_asg.name

    target_tracking_configuration {
        predefined_metric_specification {
            predefined_metric_type = "ASGAverageCPUUtilization"
        }

        target_value = 20.0
    }
} 
