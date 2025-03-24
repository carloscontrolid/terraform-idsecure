# rds_access.tf

resource "aws_memorydb_user" "idsecure-memorydb-user" {
  user_name     = "idsecure-memorydb-user"
  access_string = "on ~* +@all"
  authentication_mode {
    type      = "password"
    passwords = [var.memorydb_password]
  }
}
