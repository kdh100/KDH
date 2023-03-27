terraform {
  required_providers {
    aws = {
      version = "~> 3.33.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  access_key                  = var.access_key
  secret_key                  = var.secret_key
  insecure                    = true
  skip_metadata_api_check     = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  endpoints {
    ec2        = "https://${var.zcompute_ip}/api/v2/aws/ec2"
    elb        = "https://${var.zcompute_ip}/api/v2/aws/elbv2"
    iam        = "https://${var.zcompute_ip}/api/v2/aws/iam"
    route53    = "https://${var.zcompute_ip}/api/v2/aws/route53"
    asg        = "https://${var.zcompute_ip}/api/v2/aws/autoscaling"
    cloudwatch = "https://${var.zcompute_ip}/api/v2/aws/cloudwatch"
    sns        = "https://${var.zcompute_ip}/api/v2/aws/sns"
    efs        = "https://${var.zcompute_ip}/api/v2/aws/efs"
    s3         = "https://${var.zcompute_ip}:1061/"
  }
}