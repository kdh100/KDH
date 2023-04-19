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
    #shared_credentials_file = var.credentials_file
    endpoints {
        ec2         = "https://${var.zCompute_ip}/api/v2/aws/ec2"
        elb         = "https://${var.zCompute_ip}/api/v2/aws/elbv2"
        s3          = "https://${var.zCompute_ip}:1061/"
        rds         = "https://${var.zCompute_ip}/api/v2/aws/rds"
        iam         = "https://${var.zCompute_ip}/api/v2/aws/iam"
        route53     = "https://${var.zCompute_ip}/api/v2/aws/route53"
        sts         = "https://${var.zCompute_ip}/api/v2/aws/sts"
  }
  default_tags {
    tags = {
      Environment = "zCompute_Korea"
      Owner       = "Daeyeong"
    }
  }
    region   = "us-east-2"
    insecure = true
    skip_metadata_api_check     = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
}

