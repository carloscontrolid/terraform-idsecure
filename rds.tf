# # rds.tf
# resource "aws_db_instance" "idsecure-rds" {
#   identifier             = "idsecure-db"
#   engine                 = "postgres"
#   engine_version         = "15"
#   instance_class         = "db.t3.micro"
#   allocated_storage      = 20
#   storage_type           = "gp2"
#   username               = var.db_username
#   password               = var.db_password
#   db_subnet_group_name   = aws_db_subnet_group.idsecure-db-subnet-group.name
#   vpc_security_group_ids = [aws_security_group.idsecure-db_sg.id]
#   publicly_accessible    = true
#   skip_final_snapshot    = true

#   tags = {
#     Name        = "idsecure-db"
#     Terraformed = var.terraform_tag
#   }
# }

# resource "aws_db_subnet_group" "idsecure-db-subnet-group" {
#   name       = "idsecure-db-subnet-group"
#   subnet_ids = [aws_subnet.idsecure-public_subnet.id, aws_subnet.idsecure-public_subnet_b.id]

#   tags = {
#     Name        = "idsecure-db-subnet-group"
#     Terraformed = var.terraform_tag
#   }
# }

# resource "aws_security_group" "idsecure-db_sg" {
#   vpc_id = aws_vpc.idsecure-vpc.id

#   ingress {
#     from_port   = 5432
#     to_port     = 5432
#     protocol    = "tcp"
#     cidr_blocks = var.trusted_ips
#     description = "Allow PostgreSQL from trusted IPs"
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name        = "idsecure-db-sg"
#     Terraformed = var.terraform_tag
#   }
# }

# resource "aws_subnet" "idsecure-public_subnet_b" {
#   vpc_id                  = aws_vpc.idsecure-vpc.id
#   cidr_block              = "10.0.2.0/24"
#   map_public_ip_on_launch = true
#   availability_zone       = "sa-east-1b"

#   tags = {
#     Name        = "idsecure-public-subnet-b"
#     Terraformed = var.terraform_tag
#   }
# }