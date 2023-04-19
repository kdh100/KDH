resource "aws_key_pair" "mykey" {
  key_name_prefix = "mykey"
  public_key      = file("mykey.pub")
}

# Bastion 만들기

resource "aws_instance" "bastion-server" {
    ami = var.image_ami
    instance_type= var.web_servers_type
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.bastion_sg_test.id]
    key_name = aws_key_pair.mykey.key_name

    tags = {
        Name = "bastion-VM"
    }
}

# Web Instace 만들기
resource "aws_instance" "web-server0" {
    ami = var.image_ami
    instance_type= var.web_servers_type
    subnet_id = aws_subnet.private_subnet.id
    vpc_security_group_ids = [aws_security_group.bastion_sg_test.id]

    key_name = aws_key_pair.mykey.key_name


    tags = {
        Name = "web-VM1"
    }
}

resource "aws_instance" "web-server1" {
    ami = var.image_ami
    instance_type= var.web_servers_type
    subnet_id = aws_subnet.private_subnet.id
    vpc_security_group_ids = [aws_security_group.bastion_sg_test.id]

    key_name = aws_key_pair.mykey.key_name


    tags = {
        Name = "web-VM2"
    }
} 

resource "aws_security_group" "bastion_sg_test" {
  name = "bastion-sg-test"
  vpc_id = aws_vpc.lab-vpc.id
  
  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 0
    to_port = 65535
    protocol = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port = 0
    to_port = 65535
    protocol = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


