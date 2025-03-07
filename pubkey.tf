# pubkey.ft
resource "aws_key_pair" "terraform_key_pub" {
  key_name   = "pub_key_carlos"
  public_key = var.pub_key_carlos
}