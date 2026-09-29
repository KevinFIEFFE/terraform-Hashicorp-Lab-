resource "aws_vpc" "production" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "production"
  }
}

resource "aws_vpc" "dev" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "dev"
  }
}

resource "aws_subnet" "workloads" {
  vpc_id     = aws_vpc.production.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "workloads"
  }
}