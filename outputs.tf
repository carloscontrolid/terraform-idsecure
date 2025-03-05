#output.ft
output "instance_ids" {
  value = {
    idsecure-homolog-01 = aws_instance.idsecure-homolog-01.id
  }
}

output "public_ips" {
  value = {
    idsecure-homolog-01 = aws_instance.idsecure-homolog-01.public_ip
  }
}

output "allowed_ips" {
  value = aws_security_group.idsecure-ssh_sg.ingress[*].cidr_blocks
}