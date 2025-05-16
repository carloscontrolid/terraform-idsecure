# rds_security_groups.tf
# Security Group para RDS
resource "aws_security_group" "idsecure-sg-db" {
  vpc_id = aws_vpc.idsecure-vpc.id
  name = "idsecure-sg-db"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Allow MySQL from trusted IPs"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
    prevent_destroy = false
  }

  tags = {
    Name        = "idsecure-db-sg"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}

# Security Group para MemoryDB
resource "aws_security_group" "idsecure-sg-memorydb" {
  vpc_id = aws_vpc.idsecure-vpc.id
  name = "idsecure-memorydb-sg"

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Allow Redis from trusted IPs"
  }

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Redis from all"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
    prevent_destroy = false
  }

  tags = {
    Name        = "idsecure-memorydb-sg"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}


resource "aws_security_group" "idsecure-sg-db-01" {
  vpc_id = aws_vpc.idsecure-vpc.id
  name = "idsecure-sg-db-01"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Allow MySQL from trusted IPs"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
    prevent_destroy = false
  }

  tags = {
    Name        = "idsecure-db-sg-01"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}

# Security Group para MemoryDB
resource "aws_security_group" "idsecure-sg-memorydb-01" {
  vpc_id = aws_vpc.idsecure-vpc.id
  name = "idsecure-memorydb-sg-01"

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Allow Redis from trusted IPs"
  }

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Redis from all"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
    prevent_destroy = false
  }

  tags = {
    Name        = "idsecure-memorydb-sg-01"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}
