# Create VPC

resource "aws_vpc" "vpc1_kdh" {
  cidr_block         = "10.0.0.0/16"
  enable_dns_support = true
}

# Create Subnet

resource "aws_subnet" "private_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.vpc1_kdh.id
}

resource "aws_subnet" "public_subnet" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.vpc1_kdh.id
}

# Create IGW

resource "aws_internet_gateway" "igw_kdh" {
  vpc_id = aws_vpc.vpc1_kdh.id
}

# Associate IGW including default route with VPC

resource "aws_default_route_table" "rt_kdh" {
  default_route_table_id = aws_vpc.vpc1_kdh.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_kdh.id
  }
}

# Associate DHCP option with VPC

resource "aws_vpc_dhcp_options_association" "dhcprule_association" {
  vpc_id          = aws_vpc.vpc1_kdh.id
  dhcp_options_id = aws_vpc_dhcp_options.dhcprule.id
}

# Create Security Group

resource "aws_security_group" "sg1_kdh" {
  name = "sg1_kdh"
  vpc_id = aws_vpc.vpc1_kdh.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create two instances

resource "aws_instance" "private_vm1_kdh" {
  ami                    = var.image_ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [ "aws_security_group.private_sg1.id" ]
}

resource "aws_instance" "public_vm1_kdh" {
  ami                    = var.image_ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [ "aws_security_group.public_sg1.id" ]
}