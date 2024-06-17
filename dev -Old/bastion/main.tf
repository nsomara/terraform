terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  alias  = "dev"
  region = var.region
}

# Security Group for Bastion
resource "aws_security_group" "bastion_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "Linux_Bastion_Dev Security Group" })
}

# Bastion Instance
resource "aws_instance" "bastion" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  iam_instance_profile   = var.ssm_instance_profile_name

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y amazon-ssm-agent
              sudo systemctl enable amazon-ssm-agent
              sudo systemctl start amazon-ssm-agent
              EOF

  tags = merge(var.tags, { Name = "Linux_Bastion_Dev" })
}
