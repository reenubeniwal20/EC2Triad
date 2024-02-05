data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.5.0"
  count   = 1

  name                 = "ec2-nginx-demo"
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = "t2.micro"
  vpc_security_group_ids = [aws_security_group.nginx_demo.id]
  key_name             = var.key_name
  user_data            = file("main.sh")

  tags = {
    Name = "NginxDemo"
  }
}

resource "aws_default_vpc" "default" {}

resource "aws_security_group" "nginx_demo" {
  name        = "devkey"
  description = "SSH on port 22, HTTP on port 80, and custom ports for Node.js and MongoDB"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000  # Node.js port
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 27017  # MongoDB port
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
