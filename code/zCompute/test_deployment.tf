resource "aws_vpc" "vpc1_kdh" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_vpc_dhcp_options" "dhcprule1_kdh" {
  domain_name          = "symphony.local"
  domain_name_servers  = ["8.8.8.8", "8.8.4.4"]
  ntp_servers          = ["127.0.0.1"]
  netbios_name_servers = ["127.0.0.1"]
  netbios_node_type    = 2
}

resource "aws_vpc_dhcp_options_association" "dhcprule1_kdh_attach" {
  vpc_id          = aws_vpc.vpc1_kdh.id
  dhcp_options_id = aws_vpc_dhcp_options.dhcprule1_kdh.id
}

resource "aws_subnet" "public1_vpc1_kdh" {
  vpc_id            = aws_vpc.vpc1_kdh.id
  cidr_block        = "10.0.1.0/24"
}

resource "aws_network_interface" "nic1_vm1_kdh" {
  subnet_id   = aws_subnet.public1_vpc1_kdh.id
  private_ips = ["10.0.1.100"]
}

resource "aws_security_group" "sg1_kdh" {
  name        = "sg1_kdh"
  vpc_id      = aws_vpc.vpc1_kdh.id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "kdh_keypair" {  # need configure
  key_name   = "kdh100"
  public_key = "copy and paste after zcompute keypair created"
}

resource "aws_instance" "vm1_kdh" {
  ami           = "ami-80f02613a66a4e58a758f98d182f9489"
  instance_type = "t3.medium"

  key_name      = aws_key_pair.kdh_keypair.key_name  # need verify

  network_interface {
    network_interface_id = aws_network_interface.nic1_vm1_kdh.id
    device_index         = 0
  }
}

resource "aws_internet_gateway" "igw_kdh" {
  vpc_id = aws_vpc.vpc1_kdh.id
}

resource "aws_route_table" "rt1_kdh" {
  vpc_id = aws_vpc.vpc1_kdh.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_kdh.id
  }
}

resource "aws_eip" "eip_kdh" {
  vpc = true
  instance                  = aws_instance.vm1_kdh.id
  associate_with_private_ip = "10.0.1.100"
  depends_on                = [aws_internet_gateway.gw]
}