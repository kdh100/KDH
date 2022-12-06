provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    encrypt        = false
    bucket         = "bucket-1991-0819"
    dynamodb_table = "tf-state-lock-dynamo"
    key            = "tf/project3/terraform-tfstate"
    region         = "us-east-2"
  }
}

resource "aws_vpc" "tf-test" {
  cidr_block          = "10.0.0.0/16"
  instance_tanency    = "default"
  enable_dns_support  = true
  enable_dns_hostname = true
  tags = {
    Name = "tf_test"
  }  
}

resource "aws_subnet" "subnet-tf-public" {
  vpc_id            = aws_vpc.tf-test.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "subnet-tf-public"
  }
}

resource "aws_subnet" "subnet-tf-private" {
  vpc_id            = aws_vpc.tf-test.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-2b"
  tags = {
    Name = "subnet-tf-private"
  }
}