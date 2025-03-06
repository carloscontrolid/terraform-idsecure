# ecr.tf
resource "aws_ecr_repository" "idsecure_repo" {
  name = "idsecure-homolog-online"

  tags = {
    Name        = "idsecure-ecr"
    Terraformed = var.terraform_tag
  }
}

output "ecr_repository_url" {
  value = aws_ecr_repository.idsecure_repo.repository_url
}