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

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "private_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "dhcp_domain_name" {
  default = "symphony.local"
}

variable "dhcp_domain_name_server" {
  default = "8.8.8.8"
}

variable "security_group_name" {
  default = "sg1_kdh"
}