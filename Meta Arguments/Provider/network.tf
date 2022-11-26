resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "VPC-Terraform-SP"
  }
}

resource "aws_vpc" "vpc_euro" {
  provider = aws.Europa

  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "VPC-Terraform-Euro"
  }
}