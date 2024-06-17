output "web_instance_id" {
  value = aws_instance.web_server.id
}

output "web_private_ip" {
  value = aws_instance.web_server.private_ip
}
