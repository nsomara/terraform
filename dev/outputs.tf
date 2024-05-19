output "instance1_name" {
  value = aws_instance.example_dev.tags["Name"]
}

output "instance1_public_ip" {
  value = aws_instance.example_dev.public_ip
}

output "instance2_name" {
  value = aws_instance.example2_dev.tags["Name"]
}

output "instance2_public_ip" {
  value = aws_instance.example2_dev.public_ip
}
