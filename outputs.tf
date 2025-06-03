# output.tf

output "instance_ids" {
  value = {
    idsecure-homolog-01 = aws_instance.idsecure-homolog-01.id
    # idsecure-windows-01 = aws_instance.idsecure-windows-01.id
  }
}

output "public_ips" {
  value = {
    idsecure-homolog-01 = aws_instance.idsecure-homolog-01.public_ip
    # idsecure-windows-01 = aws_instance.idsecure-windows-01.public_ip
  }
}

output "allowed_ips" {
  value = distinct(flatten(aws_security_group.idsecure-sg-ssh.ingress[*].cidr_blocks))
}

####### DataBase #######
output "mysql_endpoint" {
  value = aws_db_instance.idsecure-mysql-rds.endpoint
}

output "memorydb_endpoint" {
  value = aws_memorydb_cluster.idsecure-memorydb.cluster_endpoint
}
