resource "aws_instance" "example_dev" {
  provider = aws.dev
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "ExampleInstanceDev"
  }
}

resource "aws_instance" "example2_dev" {
  provider = aws.dev
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "ExampleInstance2Dev"
  }
}
