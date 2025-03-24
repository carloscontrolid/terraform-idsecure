# # rds.tf

# # RDS
# resource "aws_db_instance" "idsecure-rds" {
#   identifier             = "idsecure-db"
#   engine                 = "postgres"
#   engine_version         = "15"
#   instance_class         = "db.t3.micro"
#   allocated_storage      = 20
#   storage_type           = "gp2"
#   username               = var.db_username
#   password               = var.db_password
#   db_subnet_group_name   = aws_db_subnet_group.idsecure-rds-sg.name
#   vpc_security_group_ids = [aws_security_group.idsecure-sg-db.id]
#   publicly_accessible    = true
#   skip_final_snapshot    = true

#   tags = {
#     Name        = "idsecure-db"
#     Terraformed = var.terraform_tag
#   }
# }

# # DB Subnet Group
# resource "aws_db_subnet_group" "idsecure-rds-sg" {
#   name       = "idsecure-rds-subnet-group"
#   subnet_ids = [
#     aws_subnet.idsecure-public_subnet_a.id,
#     aws_subnet.idsecure-public_subnet_b.id
#   ]

#   tags = {
#     Name        = "idsecure-rds-subnet-group"
#     Terraformed = var.terraform_tag
#   }
# }

# resource "aws_db_subnet_group" "idsecure-sng-rds" {
#   name       = "idsecure-subnet-group-rds"
#   subnet_ids = [
#     aws_subnet.idsecure-public_subnet_a.id,
#     aws_subnet.idsecure-public_subnet_b.id
#   ]

#   tags = {
#     Name        = "idsecure-subnet-group-rds"
#     Terraformed = var.terraform_tag
#   }
# }

# # DataBase Security Group
# resource "aws_security_group" "idsecure-sg-db" {
#   vpc_id = aws_vpc.idsecure-vpc.id

#   ingress {
#     from_port   = 5432
#     to_port     = 5432
#     protocol    = "tcp"
#     cidr_blocks = var.trusted_ips
#     description = "Allow PostgreSQL from trusted IPs"
#   }

#   ingress {
#     from_port   = 5432
#     to_port     = 5432
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] #temp
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
