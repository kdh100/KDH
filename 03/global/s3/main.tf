provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "bucket-1991-0819"

  force_destroy = true
  
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }

  tags = {
    Name = "My bucket"
  }
}

resource "aws_dynamodb_table" "mytable-lock" {
  name           = "dynamodb-table-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "My table"
  }
}