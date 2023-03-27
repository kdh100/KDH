variable "zCompute_ip" {
  default = "115.71.6.118"
}

variable "access_key" {
  default = "cc6771dc04c645f9ba08a5f1070a8534"
}

variable "secret_key" {
  default = "f3dd95749bee4c9f9cc37715865ebb0a"
}

variable "image_ami" {
  description = "Ubuntu OS"
  default     = "ami-80f02613a66a4e58a758f98d182f9489"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

# variable "public_subnet_tags" {
#   description = "Additional tags for the public subnets"
#   type        = map(string)
#   default     = {}
# }
# 
# variable "private_subnet_tags" {
#   description = "Additional tags for the private subnets"
#   type        = map(string)
#   default     = {}
# }