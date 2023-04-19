# Region Credentials
variable "zCompute_ip" {
  default = "115.71.6.118"
}
variable "secret_key" {
  default = "ebe819d11368449c833f5e086a8ecde9"
}
variable "access_key" {
  default = "aafb7a1cb6634f42a243838018dd21c5"
}

variable "lb_type" {
  default = "application"
}

variable "lb_name" {
  default = "LB-TEST"
}

variable "protocol" {
  default = "HTTP"
}

# Main variables
variable "image_ami" {
  default = "ami-1cf6e579b79a47b0908539f4c3ff148c"
}

variable "web_servers_number" {
  default = 2
}

variable "web_servers_type" {
  default = "z4.medium"
}
variable "instance_username" {
  default = "centos"
}
