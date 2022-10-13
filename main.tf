provider "aws" {
  region = "us-east-1"
  profile = "default" 
}


resource "aws_vpc" "challengevpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "Terraformvpc"
  }
}
resource "aws_instance" "myinstace" {
  ami = var.ami_id
  instance_type = var.instance_type
}
resource "aws_security_group" "myterraformSG" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.challengevpc.id

  ingress {
    description = "https protocol"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "ssh protocol"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "challengesg"
  }
}