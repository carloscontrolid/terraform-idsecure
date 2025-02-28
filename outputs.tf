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