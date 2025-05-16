# test_rds_security_group.tf
resource "aws_security_group" "idsecure-teste-db" {
  vpc_id = aws_vpc.idsecure-vpc.id
  name = "idsecure-test-sg"

  ingress {
    from_port   = 3308
    to_port     = 3308
    protocol    = "tcp"
    cidr_blocks = ["177.144.150.233/32"]
    description = "test"
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
    Name        = "idsecure-test-sg"
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}