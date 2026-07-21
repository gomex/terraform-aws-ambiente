variable "instance_type" {
  type        = string
  description = "Tipo da instância EC2 a ser criada"
  default     = "t3.micro"
  sensitive   = false
}

variable "name" {
  type        = string
  description = "Nome do ambiente"
}
