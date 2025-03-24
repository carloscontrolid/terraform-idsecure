# rds_subnet.tf
# Subnet Groups para RDS
resource "aws_db_subnet_group" "idsecure-rds-sg" {
  name       = "idsecure-rds-subnet-group"
  subnet_ids = [
    aws_subnet.idsecure-public_subnet_a.id,
    aws_subnet.idsecure-public_subnet_b.id
  ]

  tags = {
    Name        = "idsecure-rds-subnet-group"
    Terraformed = var.terraform_tag
  }
}

resource "aws_db_subnet_group" "idsecure-sng-rds" {
  name       = "idsecure-subnet-group-rds"
  subnet_ids = [
    aws_subnet.idsecure-public_subnet_a.id,
    aws_subnet.idsecure-public_subnet_b.id
  ]

  tags = {
    Name        = "idsecure-subnet-group-rds"
    Terraformed = var.terraform_tag
  }
}

# Subnet Group para MemoryDB
resource "aws_memorydb_subnet_group" "idsecure-memorydb-sg" {
  name       = "idsecure-memorydb-subnet-group"
  subnet_ids = [
    aws_subnet.idsecure-public_subnet_a.id,
    aws_subnet.idsecure-public_subnet_b.id
  ]

  tags = {
    Name        = "idsecure-memorydb-subnet-group"
    Terraformed = var.terraform_tag
  }
}
