#variables.ft
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
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
}

variable "ubuntu_ami_id" {
  description = "AMI ID específica para Ubuntu na região"
  type        = string
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
  description = "Lista de IPs confiáveis para acesso SSH"
  type        = list(string)
  default     = ["200.171.205.98/32", "177.76.206.204/32", "179.193.77.224/32"]
}