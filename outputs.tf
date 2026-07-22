output "instance_ip_web" {
  description = "IP privado da maquina virtual"
  value       = { for key, instancia in aws_instance.this : key => instancia.public_ip }
}
