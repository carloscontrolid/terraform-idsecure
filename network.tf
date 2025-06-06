# network.tf

# VPC
resource "aws_vpc" "idsecure-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "idsecure-main-vpc"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}

# Internet Gateway
resource "aws_internet_gateway" "idsecure-igw" {
  vpc_id = aws_vpc.idsecure-vpc.id

  tags = {
    Name        = "idsecure-internet-gateway"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}

# Route Table
resource "aws_route_table" "idsecure-public_rt" {
  vpc_id = aws_vpc.idsecure-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.idsecure-igw.id
  }

  tags = {
    Name        = "idsecure-public-route-table"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}

# Subnets
resource "aws_subnet" "idsecure-public_subnet_a" {
  vpc_id                  = aws_vpc.idsecure-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "sa-east-1a"

  tags = {
    Name        = "idsecure-public-subnet-a"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}

resource "aws_subnet" "idsecure-public_subnet_b" {
  vpc_id                  = aws_vpc.idsecure-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "sa-east-1b"

  tags = {
    Name        = "idsecure-public-subnet-b"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}

resource "aws_subnet" "idsecure-private_subnet_a" {
  vpc_id                  = aws_vpc.idsecure-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "sa-east-1a"

  tags = {
    Name        = "idsecure-private-subnet-a"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}

resource "aws_subnet" "idsecure-private_subnet_b" {
  vpc_id                  = aws_vpc.idsecure-vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "sa-east-1b"

  tags = {
    Name        = "idsecure-private-subnet-b"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}

# Route Table Associations
resource "aws_route_table_association" "idsecure-public_rta_a" {
  subnet_id      = aws_subnet.idsecure-public_subnet_a.id
  route_table_id = aws_route_table.idsecure-public_rt.id
}

resource "aws_route_table_association" "idsecure-public_rta_b" {
  subnet_id      = aws_subnet.idsecure-public_subnet_b.id
  route_table_id = aws_route_table.idsecure-public_rt.id
}

