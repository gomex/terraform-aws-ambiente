output "instance_ip" {
  description = "IP publico das maquinas virtuais"
  value       = { for key, instancia in aws_instance.this : key => instancia.public_ip }
}
