output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.dev_vpc.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.dev_public_subnet.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.dev_private_subnet.id
}
