output "instance1_name" {
  value = aws_instance.example_prod.tags["Name"]
}

output "instance1_public_ip" {
  value = aws_instance.example_prod.public_ip
}

output "instance2_name" {
  value = aws_instance.example2_prod.tags["Name"]
}

output "instance2_public_ip" {
  value = aws_instance.example2_prod.public_ip
}
