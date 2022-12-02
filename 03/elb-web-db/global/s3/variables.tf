# default value is empty because it is has to be unique so values should be inserted
variable "bucket_name" {
  description = "The name of the S3 bucket. Must be globally unique."
  type        = string
}

# default value is empty because it is has to be unique so values should be inserted
variable "table_name" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
}