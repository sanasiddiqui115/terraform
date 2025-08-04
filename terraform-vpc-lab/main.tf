provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "sana_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "SanaVPC"
  }
}

resource "aws_subnet" "sana_public_subnet" {
  vpc_id                  = aws_vpc.sana_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"

  tags = {
    Name = "SanaPublicSubnet"
  }
}

resource "aws_internet_gateway" "sana_igw" {
  vpc_id = aws_vpc.sana_vpc.id

  tags = {
    Name = "SanaInternetGateway"
  }
}

resource "aws_route_table" "sana_public_rt" {
  vpc_id = aws_vpc.sana_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sana_igw.id
  }

  tags = {
    Name = "SanaPublicRouteTable"
  }
}

resource "aws_route_table_association" "sana_public_rt_assoc" {
  subnet_id      = aws_subnet.sana_public_subnet.id
  route_table_id = aws_route_table.sana_public_rt.id
}

resource "aws_security_group" "sana_ec2_sg" {
  name        = "EC2SecurityGroup"
  description = "Allow SSH access"
  vpc_id      = aws_vpc.sana_vpc.id

  ingress {
    description = "SSH from anywhere (for lab purposes; restrict in production)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SanaEC2SecurityGroup"
  }
}

resource "aws_instance" "sana_web_server" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.sana_public_subnet.id
  vpc_security_group_ids = [aws_security_group.sana_ec2_sg.id]
  key_name               = "my-key"
 
  tags = {
    Name = "WebServerInstance"
  }
}
