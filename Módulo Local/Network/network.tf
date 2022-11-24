resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_vpc

  tags = {
    Name = "VPC-$(var.environment}"
  }
}

resource "aws_subnet" "SubNet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.cidr_subnet

  tags = {
    Name = "SubNet-$(var.environment}"
  }
}

resource "aws_internet_gateway" "InternetGatway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "InternetGatway-$(var.environment}"
  }
}

resource "aws_route_table" "RouteTable" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.InternetGatway.id
  }

  tags = {
    Name = "RouteTable-$(var.environment}"
  }
}

resource "aws_route_table_association" "RTA" {
  subnet_id      = aws_subnet.SubNet.id
  route_table_id = aws_route_table.RouteTable.id
}

resource "aws_security_group" "AllowSSH" {
  name   = "security-group-$(var.environment}"
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