resource "aws_instance" "example" {
  provider = aws.security
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "ExampleInstance"
  }
}

resource "aws_instance" "example2" {
  provider = aws.security
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "ExampleInstance2"
  }
}
