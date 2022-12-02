provider "aws" {
  region = "us-east-2"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket         = "bucket-1991-0819"
    key            = "home/tf/03/global/s3/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "dynamodb-table-lock"
    encrypt        = true
  }
}

resource "aws_instance" "example-remote-state" {
  ami           = "ami-0d5bf08bc8017c83b"
  instance_type = "t2.micro"

  tags = {
    Name = "example-remote-state"
  }
}