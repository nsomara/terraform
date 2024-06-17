output "vpc_id" {
  value = aws_vpc.dev_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.dev_public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.dev_private_subnet.id
}
