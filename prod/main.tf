resource "aws_instance" "example_prod" {
  provider = aws.prod
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "ExampleInstanceProd"
  }
}

resource "aws_instance" "example2_prod" {
  provider = aws.prod
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "ExampleInstance2Prod"
  }
}
