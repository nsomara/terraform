output "instance1_name" {
  value = aws_instance.example.tags["Name"]
}

output "instance1_public_ip" {
  value = aws_instance.example.public_ip
}

output "instance2_name" {
  value = aws_instance.example2.tags["Name"]
}

output "instance2_public_ip" {
  value = aws_instance.example2.public_ip
}
