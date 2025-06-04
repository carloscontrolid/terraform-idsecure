# variables.ft
variable "AWS_ACCESS_KEY_ID" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "sa-east-1"
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
  default     = "sa-east-1a"
}

variable "ubuntu_instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t2.medium"
}

variable "windows_instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t3.micro"
}

variable "ubuntu_ami_id" {
  description = "AMI ID específica para Ubuntu na região"
  type        = string
  default     = "ami-0e4d8b17924d1eda7"
}

variable "windows_ami_id" {
  description = "AMI ID específica para Windows Server na região"
  type        = string
  default     = "ami-0efbe79a4e1e1cade"
}

variable "pub_key_carlos" {
  description = "Public Key Carlos"
  type        = string
}

variable "terraform_tag" {
  description = "Default tag for terraformed resources"
  type        = bool
  default     = true
}

variable "ssh_enable" {
  description = "Default tag for servers with ssh enable"
  type        = bool
  default     = true
}

variable "trusted_ips" {
  type = set(string)
  default = [
    "56.124.100.2/32",
    "170.0.58.116/32",
    "177.76.206.204/32",
    "177.84.240.162/32",
    "179.110.233.166/32",
    "179.193.77.224/32",
    "186.240.135.64/32",
    "187.75.34.21/32",
    "200.171.205.98/32",
    "201.6.116.97/32",
  ]
}

locals {
  sorted_trusted_ips = sort(var.trusted_ips)
}

####### DATABASE #######
variable "db_username" {
  description = "Usuário do banco de dados RDS"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Senha do banco de dados RDS"
  type        = string
  sensitive   = true
}

variable "memorydb_password" {
  description = "Senha do usuário do MemoryDB"
  type        = string
  sensitive   = true
}

variable "costcenter" {
  description = "Cost center"
  type        = string
  default     = "idsecure"
}
