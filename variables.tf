variable "instance_type" {
  type        = string
  description = "Tipo da instância EC2 a ser criada"
  default     = "t3.micro"
  sensitive   = false
}

# variable "name" {
#   type        = string
#   description = "Nome do projeto"
# }

variable "env" {
  type        = string
  description = "Nome do ambiente"
}

variable "instancias" {
  type = map(object({
    instance_type = string
    plataforma    = string
  }))
  description = "Mapa das instancias a serem criadas"
}
