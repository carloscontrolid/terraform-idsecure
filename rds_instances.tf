# PostgreSQL
# MySQL
resource "aws_db_instance" "idsecure-mysql-rds" {
  identifier             = "idsecure-mysql-db"
  engine                 = "mysql"
  engine_version         = "8.0.35"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.idsecure-rds-sg.name
  vpc_security_group_ids = [aws_security_group.idsecure-sg-db.id]
  publicly_accessible    = true
  skip_final_snapshot    = true
  port                   = 3306

  tags = {
    Name        = "idsecure-mysql-db"
    Terraformed = var.terraform_tag
  }
}

# MemoryDB
resource "aws_memorydb_cluster" "idsecure-memorydb" {
  acl_name                 = "open-access"
  name                     = "idsecure-memorydb"
  node_type                = "db.t4g.small"
  num_shards               = 1
  security_group_ids       = [aws_security_group.idsecure-sg-memorydb.id]
  subnet_group_name        = aws_memorydb_subnet_group.idsecure-memorydb-sg.name
  tls_enabled              = true
  port                     = 6379

  tags = {
    Name        = "idsecure-memorydb"
    Terraformed = var.terraform_tag
  }
}
