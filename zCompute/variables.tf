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

variable "public_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "dhcp_domain_name" {
  default = "symphony.local"
}

variable "dhcp_dns_resolver" {
  default = "8.8.8.8"
}

variable "vm_sg_name" {
  default = "vm-sg-kdh"
}

variable "lb_sg_name" {
  default = "lb-sg-kdh"
}

variable "lb_name" {
  default = "lb-kdh"
}

variable "lb_tg_name" {
  default = "lb-tg-kdh"
}

variable "launch_configuration_name" {
  default = "lg-kdh"
}

variable "asg_name" {
  default = "asg-kdh"
}

variable "asg_policy_name" {
  default = "asg-policy-kdh"
}

variable "protocol_HTTP" {
  default = "HTTP"
}