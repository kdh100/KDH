# VPC 만들기
resource "aws_vpc" "lab-vpc" {
  cidr_block = "10.0.0.0/16"

  enable_dns_support = true

  tags = {
    Name = "tf-vpc"
  }
}


# Public Subnet 구성하기
resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.lab-vpc.id
    cidr_block = "10.0.10.0/24"
    
    tags = {
        Name = "tf-subnet-Public"
    }
}

# Private Subnet 구성하기
resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.lab-vpc.id
    cidr_block = "10.0.20.0/24"

    tags = {
        Name = "tf-subnet-Private"
    }
}

# # add dhcp options
resource "aws_vpc_dhcp_options" "dns_resolver" {
  domain_name_servers = ["8.8.8.8", "8.8.4.4"]
}

# # associate dhcp with vpc
resource "aws_vpc_dhcp_options_association" "dns_resolver_association" {
  vpc_id          = aws_vpc.lab-vpc.id
  dhcp_options_id = aws_vpc_dhcp_options.dns_resolver.id
}

# # create igw
resource "aws_internet_gateway" "app_igw" {
  vpc_id = aws_vpc.lab-vpc.id
}

# #new default route table with igw association
resource "aws_default_route_table" "default_rt" {
  default_route_table_id = aws_vpc.lab-vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app_igw.id
  }
}

# EIP 만들기
resource "aws_eip" "tf_eip" {
  vpc = true

  tags = {
    Name = "tf-eip-ap-northeast-2a"
  }
}

# bastion에 eip 붙이기
resource "aws_eip" "bastion_eip" {
    vpc = true

}

resource "aws_eip_association" "bastion_eip_ass" {
    instance_id = aws_instance.bastion-server.id
    allocation_id = aws_eip.bastion_eip.id
}

output "public_ip" {
  value = aws_eip.bastion_eip.public_ip
}

# Nat 게이트웨이 만들어서 public서브넷에 붙이기
# 의존성을 걸어서 internet 게이트웨이가 만들어 진 후에 만들어지도록 하
resource "aws_nat_gateway" "gw_a" {
    allocation_id = aws_eip.tf_eip.id
    subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "tf-natgw-public"
  }

  depends_on = [aws_internet_gateway.app_igw]
}


