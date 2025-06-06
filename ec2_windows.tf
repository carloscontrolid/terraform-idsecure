# ec2_windows.tf
resource "aws_instance" "idsecure-windows-01" {
  ami                    = var.windows_ami_id
  instance_type          = var.windows_instance_type
  key_name               = "windows-key.pub"
  vpc_security_group_ids = [aws_security_group.idsecure-sg-rdp.id, aws_security_group.idsecure-sg-open-all.id]
  subnet_id              = aws_subnet.idsecure-public_subnet_a.id
  availability_zone      = var.availability_zone
  associate_public_ip_address = true

  tags = {
    Name        = "idsecure-windows-01"
    RDP         = true
    Terraformed = var.terraform_tag
    CostCenter  = var.costcenter
  }
}