
#---------------------------------------------------------------------------------
# Creating VPC
#---------------------------------------------------------------------------------

resource "aws_vpc" "lab-vpc" {
  cidr_block         = "172.21.0.0/16"
  enable_dns_support = true
  tags = {
    Name = "lab-vpc"
    }
}

#---------------------------------------------------------------------------------
# Creating Subnet
#---------------------------------------------------------------------------------

resource "aws_subnet" "internal_subnet" {
  cidr_block = "172.21.1.0/24"
  vpc_id     = aws_vpc.lab-vpc.id

  tags = {
    Name = "LAB Example web subnet"
  }
}

# resource "aws_subnet" "lb_subnet" {
#   cidr_block = "172.21.2.0/24"
#   vpc_id     = aws_vpc.alb-vpc.id

#   tags = {
#     Name = "ALB Example lb subnet"
#   }
# }


# # add dhcp options
# #resource "aws_vpc_dhcp_options" "dns_resolver" {
# #  domain_name_servers = ["8.8.8.8", "8.8.4.4"]
# #}

# # associate dhcp with vpc
# #resource "aws_vpc_dhcp_options_association" "dns_resolver_association" {
# #  vpc_id          = aws_vpc.alb-vpc.id
# #  dhcp_options_id = aws_vpc_dhcp_options.dns_resolver.id
# #}

# # create igw
# resource "aws_internet_gateway" "app_igw" {
#   vpc_id = aws_vpc.alb-vpc.id
# }

# #new default route table with igw association
# resource "aws_default_route_table" "default_rt" {
#   default_route_table_id = aws_vpc.alb-vpc.default_route_table_id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.app_igw.id
#   }
# }

# ###################################
# # Cloud init data
# data "template_file" "webconfig" {
#   template = file("./webconfig.cfg")
# }

# data "template_cloudinit_config" "web_config" {
#   gzip          = false
#   base64_encode = false

#   part {
#     filename     = "webconfig.cfg"
#     content_type = "text/cloud-config"
#     content      = data.template_file.webconfig.rendered
#   }
# }

# ###################################

# # Creating two instances of web server ami with cloudinit
# resource "aws_instance" "web-server" {
#   ami           = var.image_ami
#   instance_type = var.web_servers_type
#   subnet_id     = aws_subnet.internal_subnet.id
#   vpc_security_group_ids = [aws_security_group.web-sec.id]
#   user_data              = data.template_cloudinit_config.web_config.rendered

#   tags = {
#     Name = "Web server ${count.index}"
#   }

#   count = var.web_servers_number
# }

# ##################################
# # Security group definitions
# # Web server sec group

# resource "aws_security_group" "web-sec" {
#   name   = "webserver-secgroup"
#   vpc_id = aws_vpc.alb-vpc.id

#   # Internal HTTP access from anywhere
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   #ssh from anywhere (for debugging)
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   # ping access from anywhere
#   ingress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "icmp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }