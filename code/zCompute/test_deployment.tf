# Create VPC

resource "aws_vpc" "vpc1_kdh" {
  cidr_block         = "10.0.0.0/16"
  enable_dns_support = true
  tags = {
    Name = "vpc1_kdh"
  }
}

# Create Subnet

resource "aws_subnet" "private_subnet1" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.vpc1_kdh.id
  tags = {
    Name = "private_subnet1"
  }
}

resource "aws_subnet" "public_subnet1" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.vpc1_kdh.id
  tags = {
    Name = "public_subnet1"
  }
}

# Create IGW

resource "aws_internet_gateway" "igw_kdh" {
  vpc_id = aws_vpc.vpc1_kdh.id
  tags = {
    Name = "igw_kdh"
  }
}

# Associate IGW including default route with VPC

resource "aws_default_route_table" "rt_kdh" {
  default_route_table_id = aws_vpc.vpc1_kdh.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_kdh.id
  }
}

# Create DHCP option

resource "aws_vpc_dhcp_options" "dhcprule1" {
  domain_name = "symphony.local"
  domain_name_servers = ["8.8.8.8"]
  tags = {
    Name = "dhcprule1"
  }
}

# Associate DHCP option with VPC

resource "aws_vpc_dhcp_options_association" "dhcprule_association" {
  vpc_id          = aws_vpc.vpc1_kdh.id
  dhcp_options_id = aws_vpc_dhcp_options.dhcprule1.id
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
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create two instances

resource "aws_instance" "privm1" {
  ami                    = var.image_ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_subnet1.id
  vpc_security_group_ids = [ "aws_security_group.sg1_kdh.id" ]
  tags = {
    Name = "privm1"
  }
}

resource "aws_instance" "pubvm1" {
  ami                    = var.image_ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet1.id
  vpc_security_group_ids = [ "aws_security_group.sg1_kdh.id" ]
  tags = {
    Name = "pubvm1"
  }
}