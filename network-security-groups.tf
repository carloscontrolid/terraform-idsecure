# Security Group
resource "aws_security_group" "idsecure-sg-ssh" {
  vpc_id = aws_vpc.idsecure-vpc.id
  name = "idsecure-sg-ssh"

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

  lifecycle {
    create_before_destroy = true
    prevent_destroy = false
  }

  tags = {
    Name        = "idsecure-sg-ssh"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}

resource "aws_security_group" "idsecure-sg-portainer" {
  vpc_id = aws_vpc.idsecure-vpc.id
  name = "idsecure-sg-portainer"

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

  lifecycle {
    create_before_destroy = true
    prevent_destroy = false
  }

  tags = {
    Name        = "idsecure-sg-portainer"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}

resource "aws_security_group" "idsecure-sg-apps" {
  vpc_id = aws_vpc.idsecure-vpc.id
  name = "idsecure-sg-apps"

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

  lifecycle {
    create_before_destroy = true
    prevent_destroy = false
  }

  tags = {
    Name        = "idsecure-sg-apps"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}

resource "aws_security_group" "idsecure-sg-rdp" {
  vpc_id = aws_vpc.idsecure-vpc.id
  name = "idsecure-sg-rdp"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = local.sorted_trusted_ips
    description = "Allow RDP from trusted IPs"
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
    Name        = "idsecure-sg-rdp"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}
