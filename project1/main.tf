resource "aws_vpc" "kdh_vpc" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "dev"
  }
}

resource "aws_subnet" "kdh_public_subnet" {
  vpc_id                  = aws_vpc.kdh_vpc.id
  cidr_block              = "10.123.1.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "dev-public-subnet"
  }
}

resource "aws_internet_gateway" "kdh_igw" {
  vpc_id = aws_vpc.kdh_vpc.id

  tags = {
    Name = "dev-public-igw"
  }
}

resource "aws_route_table" "kdh_rt" {
  vpc_id = aws_vpc.kdh_vpc.id

  tags = {
    Name = "dev-public-rt"
  }
}

resource "aws_route" "kdh_default_route" {
  route_table_id            = aws_route_table.kdh_rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.kdh_igw.id
}

resource "aws_route_table_association" "kdh_gw_subnet_assoc" {
  subnet_id      = aws_subnet.kdh_public_subnet.id
  route_table_id = aws_route_table.kdh_rt.id
}

resource "aws_security_group" "kdh_sg" {
  description = "dev_sg"
  vpc_id      = aws_vpc.kdh_vpc.id
  name        = "dev security group"

  ingress {
    description = "All allow incoming traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    description = "All allow outgoing traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  tags = {
    Name = "dev-sg"
  }
}

data "aws_ami" "dev-ubuntu-ami" {
  most_recent      = true
  owners           = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "kdh_auth" {
  key_name   = "kdh_auth_key"
  public_key = file("~/.ssh/kdhkey.pub")
}

resource "aws_instance" "kdh_instance" {
  ami           = data.aws_ami.dev-ubuntu-ami.id
  instance_type = "t2.micro"

  key_name               = aws_key_pair.kdh_auth.id
  vpc_security_group_ids = [aws_security_group.kdh_sg.id]
  subnet_id              = aws_subnet.kdh_public_subnet.id

  user_data = file("user_data.tpl")
  user_data_replace_on_change = true

  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = "dev-instance"
  }
}