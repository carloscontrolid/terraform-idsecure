# Security Group
resource "aws_security_group" "idsecure-sg-ssh" {
  vpc_id = aws_vpc.idsecure-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Allow SSH from trusted IPs"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "idsecure-sg-ssh"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}

resource "aws_security_group" "idsecure-sg-portainer" {
  vpc_id = aws_vpc.idsecure-vpc.id

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Portainer8000"
  }

  ingress {
    from_port   = 9443
    to_port     = 9443
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Portainer9443"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "idsecure-sg-portainer"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}

resource "aws_security_group" "idsecure-sg-apps" {
  vpc_id = aws_vpc.idsecure-vpc.id

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Allow APP ports from trusted IPs"
  }

  ingress {
    from_port   = 5001
    to_port     = 5001
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Allow APP ports from trusted IPs"
  }

  ingress {
    from_port   = 5002
    to_port     = 5002
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Allow APP ports from trusted IPs"
  }

  ingress {
    from_port   = 5003
    to_port     = 5003
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Allow APP ports from trusted IPs"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "idsecure-sg-apps"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}

# Security Group 01
resource "aws_security_group" "idsecure-sg-ssh-01" {
  vpc_id = aws_vpc.idsecure-vpc.id
  name = "idsecure-sg-ssh-01"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Allow SSH from trusted IPs"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "idsecure-sg-ssh-01"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}

resource "aws_security_group" "idsecure-sg-portainer-01" {
  vpc_id = aws_vpc.idsecure-vpc.id
  name = "idsecure-sg-portainer-01"

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Portainer8000"
  }

  ingress {
    from_port   = 9443
    to_port     = 9443
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Portainer9443"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "idsecure-sg-portainer-01"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}

resource "aws_security_group" "idsecure-sg-apps-01" {
  vpc_id = aws_vpc.idsecure-vpc.id
  name = "idsecure-sg-apps-01"

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Allow APP ports from trusted IPs"
  }

  ingress {
    from_port   = 5001
    to_port     = 5001
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Allow APP ports from trusted IPs"
  }

  ingress {
    from_port   = 5002
    to_port     = 5002
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Allow APP ports from trusted IPs"
  }

  ingress {
    from_port   = 5003
    to_port     = 5003
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Allow APP ports from trusted IPs"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "idsecure-sg-apps-01"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}