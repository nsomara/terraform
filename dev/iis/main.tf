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

resource "aws_instance" "iis_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.iis_sg.id]
  subnet_id              = var.private_subnet_id
  user_data              = data.template_file.iis_user_data.rendered
  iam_instance_profile   = var.ssm_instance_profile_name
  tags                   = merge(var.tags, { Name = "IIS_Dev" })
}

resource "aws_security_group" "iis_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = []
    security_groups = [var.windows_bastion_sg_id]
  }

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = []
    security_groups = [var.windows_bastion_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

data "template_file" "iis_user_data" {
  template = file("${path.module}/iis_user_data.ps1")
}

output "iis_server_id" {
  value = aws_instance.iis_server.id
}

output "iis_server_private_ip" {
  value = aws_instance.iis_server.private_ip
}
