variable "zCompute_ip" {
  default = ""
}

variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
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