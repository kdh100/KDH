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
    ec2 = "https://${var.zCompute_ip}/api/v2/aws/ec2"
    iam = "https://${var.zCompute_ip}/api/v2/aws/iam"
  }
  region                      = "us-east-1"
  insecure                    = true
  skip_metadata_api_check     = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}