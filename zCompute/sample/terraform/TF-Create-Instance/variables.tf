# Region Credentials
variable "zCompute_ip" {}
variable "secret_key" {}
variable "access_key" {}

variable "lb_type" {
  default = "application"
}

variable "lb_name" {}

variable "protocol" {
  default = "HTTP"
}

# Main variables
variable "image_ami" {}

variable "web_servers_number" {
  default = 2
}

variable "web_servers_type" {
  default = "z4.medium"
}
variable "instance_username" {
  default = "ubuntu"
}
