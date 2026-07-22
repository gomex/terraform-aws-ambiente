variable "instance_type" {
  type        = string
  description = "Tipo da instância EC2 a ser criada"
  default     = "t3.micro"
  sensitive   = false
}

variable "name" {
  type        = string
  description = "Nome do projeto"
}

variable "criar_bd" {
  type        = bool
  description = "Feature flag para criar banco de dados"
  default     = false
}

variable "env" {
  type        = string
  description = "Nome do ambiente"
}

variable "volumes-extras" {
  type = map(object({
    device_name           = string
    volume_size           = string
    delete_on_termination = bool
  }))
}
