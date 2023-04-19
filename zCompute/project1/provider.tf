terraform {
  required_providers {
    aws = {
      version = "~> 3.33.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  endpoints {
    ec2         = "https://${var.zCompute_ip}/api/v2/aws/ec2/"
    elb         = "https://${var.zCompute_ip}/api/v2/aws/elbv2/"
    efs         = "https://${var.zCompute_ip}/api/v2/aws/efs/"
    rds         = "https://${var.zCompute_ip}/api/v2/aws/rds/"
    iam         = "https://${var.zCompute_ip}/api/v2/aws/iam/"
    sts         = "https://${var.zCompute_ip}/api/v2/aws/sts/"
    acm         = "https://${var.zCompute_ip}/api/v2/aws/acm/"
    route53     = "https://${var.zCompute_ip}/api/v2/aws/route53/"
    cloudwatch  = "https://${var.zCompute_ip}/api/v2/aws/cloudwatch/"
    autoscaling = "https://${var.zCompute_ip}/api/v2/aws/autoscaling/"
  }
  region                      = "us-east-2"
  insecure                    = true
  skip_metadata_api_check     = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  default_tags {
    tags = {
      Owner = "KDH"
    }
  }
}