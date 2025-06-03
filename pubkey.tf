# pubkey.tf

resource "aws_key_pair" "terraform_key_pub" {
  key_name   = "pub_key_carlos"
  public_key = var.pub_key_carlos
}

resource "aws_key_pair" "windows_server_key" {
  key_name   = "windows_server_key"
  public_key = var.windows_server_key
}