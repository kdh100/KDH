# create vpc
resource "aws_vpc" "vpc1_kdh" {
  cidr_block         = var.vpc_cidr
  enable_dns_support = true
}

# create private subnet
resource "aws_subnet" "private_subnet1" {
  cidr_block = var.private_subnet_cidr
  vpc_id     = aws_vpc.vpc1_kdh.id
}

# create igw
resource "aws_internet_gateway" "igw_kdh" {
  vpc_id = aws_vpc.vpc1_kdh.id
}

# associate igw including default route with vpc
resource "aws_default_route_table" "rt_kdh" {
  default_route_table_id = aws_vpc.vpc1_kdh.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_kdh.id
  }
}

# create dhcp option
resource "aws_vpc_dhcp_options" "dhcprule1" {
  domain_name = var.dhcp_domain_name
  domain_name_servers = var.dhcp_domain_name_server
}

# associate dhcp option with vpc
resource "aws_vpc_dhcp_options_association" "dhcprule_association" {
  vpc_id          = aws_vpc.vpc1_kdh.id
  dhcp_options_id = aws_vpc_dhcp_options.dhcprule1.id
}

# create security group
resource "aws_security_group" "sg1_kdh" {
  name = var.security_group_name
  vpc_id = aws_vpc.vpc1_kdh.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# create instance
resource "aws_instance" "vm1" {
  ami                    = var.image_ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_subnet1.id
  vpc_security_group_ids = [aws_security_group.sg1_kdh.id]
}