# output.ft
output "instance_ids" {
  value = {
    idsecure-homolog-01 = aws_instance.idsecure-homolog-01.id
    # idsecure-homolog-02 = aws_instance.idsecure-homolog-02.id
  }
}

output "public_ips" {
  value = {
    idsecure-homolog-01 = aws_instance.idsecure-homolog-01.public_ip
    # idsecure-homolog-02 = aws_instance.idsecure-homolog-02.public_ip
  }
}

output "allowed_ips" {
  value = distinct(flatten(aws_security_group.idsecure-ssh_sg.ingress[*].cidr_blocks))
}

####### DataBase #######
output "rds_endpoint" {
  value = aws_db_instance.idsecure-rds.endpoint
}

output "rds_address" {
  value = aws_db_instance.idsecure-rds.address
}

####### Windows #######
# output "Administrator_Password" {
#    value = [aws_instance.ec2.password_data]
#  }