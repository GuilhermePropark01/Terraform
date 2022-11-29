resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "VPC-Terraform"
  }
}

resource "aws_subnet" "SubNet" {
  count = 3

  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.${count.index}.0/24"

  tags = {
    Name = "SubNet-Terraform-${count.index}"
  }
}