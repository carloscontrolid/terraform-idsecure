# ec2.tf
resource "aws_instance" "idsecure-homolog-01" {
  ami                    = var.ubuntu_ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.terraform_key_pub.key_name
  vpc_security_group_ids = [aws_security_group.idsecure-sg-ssh.id, aws_security_group.idsecure-sg-portainer.id]
  subnet_id              = aws_subnet.idsecure-public_subnet_a.id
  availability_zone      = var.availability_zone
  associate_public_ip_address = true

  tags = {
    Name        = "idsecure-homolog-01"
    SSH         = var.ssh_enable
    Terraformed = var.terraform_tag
  }
}