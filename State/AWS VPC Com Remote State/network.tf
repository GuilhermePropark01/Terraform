resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "VPC-Terraform"
  }
}

resource "aws_subnet" "SubNet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "SubNet-Terraform"
  }
}

resource "aws_internet_gateway" "InternetGatway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "InternetGatway-Terraform"
  }
}

resource "aws_route_table" "RouteTable" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.InternetGatway.id
  }

  tags = {
    Name = "RouteTable-Terraform"
  }
}

resource "aws_route_table_association" "RTA" {
  subnet_id      = aws_subnet.SubNet.id
  route_table_id = aws_route_table.RouteTable.id
}

resource "aws_security_group" "AllowSSH" {
  name   = "security-group-terraform"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}