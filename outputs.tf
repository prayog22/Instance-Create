# outputs.tf - Output definitions

output "apache_server_public_ip" {
  description = "The public IP address of the Apache server"
  value       = aws_instance.apache_server.public_ip
}

output "apache_server_instance_id" {
  description = "The instance ID of the Apache server"
  value       = aws_instance.apache_server.id
}

output "apache_server_public_dns" {
  description = "The public DNS name of the Apache server"
  value       = aws_instance.apache_server.public_dns
}