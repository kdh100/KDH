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

# create public subnet
resource "aws_subnet" "public_subnet1" {
  cidr_block = var.public_subnet_cidr
  vpc_id     = aws_vpc.vpc1_kdh.id
}

# create igw
resource "aws_internet_gateway" "igw_kdh" {
  vpc_id = aws_vpc.vpc1_kdh.id
}

# create route table for front-end with igw
resource "aws_route_table" "fe_rt_kdh" {
  vpc_id = aws_vpc.vpc1_kdh.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_kdh.id
  }
}

# associate front-end route table to public subnet
resource "aws_route_table_association" "fe_rt_kdh_association" {
  subnet_id = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.fe_rt_kdh.id
}

# # associate igw including default route with vpc
# resource "aws_default_route_table" "rt_kdh" {
#   default_route_table_id = aws_vpc.vpc1_kdh.default_route_table_id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw_kdh.id
#   }
# }

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

# create security group for front-end service
resource "aws_security_group" "fe_sg_kdh" {
  name = var.frontend_security_group_name
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

# create security group for back-end service
resource "aws_security_group" "be_sg_kdh" {
  name = var.backend_security_group_name
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

# create instance in public subnet
# it would be front-end service for
resource "aws_instance" "vm1" {
  ami                    = var.image_ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet1.id
  vpc_security_group_ids = [aws_security_group.fe_sg_kdh.id]
}

# create instance in private subnet
# it would be back-end service for
resource "aws_instance" "vm0" {
  ami                    = var.image_ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_subnet1.id
  vpc_security_group_ids = [aws_security_group.be_sg_kdh.id]
}

# create eip for nat
resource "aws_eip" "eip1_kdh" {
  vpc = true
}

# create nat for back-end service
resource "aws_nat_gateway" "nat_kdh" {
  allocation_id = aws_eip.eip1_kdh.id
  subnet_id = aws_subnet.public_subnet1.id
  depends_on = [aws_internet_gateway.igw_kdh]
}

# create route table for back-end with nat
resource "aws_route_table" "be_rt_kdh" {
  vpc_id = aws_vpc.vpc1_kdh.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_kdh.id
  }
}

# associate back-end route table to private subnet
resource "aws_route_table_association" "be_rt_kdh_association" {
  subnet_id = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.be_rt_kdh.id
}