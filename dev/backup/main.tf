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

resource "aws_backup_vault" "dev_backup_vault" {
  name        = "dev-backup-vault"
  kms_key_arn = aws_kms_key.backup_vault_key.arn

  tags = {
    Name        = "dev-backup-vault"
    Environment = "dev"
  }
}

resource "aws_kms_key" "backup_vault_key" {
  description             = "KMS key for backup vault encryption"
  deletion_window_in_days = 30

  tags = {
    Name        = "backup-vault-key"
    Environment = "dev"
  }
}

resource "aws_kms_alias" "backup_vault_key_alias" {
  name          = "alias/backup-vault-key"
  target_key_id = aws_kms_key.backup_vault_key.id
}

resource "aws_backup_plan" "dev_backup_plan" {
  name = "dev-backup-plan"

  rule {
    rule_name         = "daily-backup"
    target_vault_name = aws_backup_vault.dev_backup_vault.name
    schedule          = "cron(0 12 * * ? *)"  # Daily at 12 PM UTC
    lifecycle {
      delete_after = 30  # Delete backups after 30 days
    }
  }
}

resource "aws_backup_selection" "dev_backup_selection" {
  iam_role_arn = aws_iam_role.backup_role.arn
  name         = "dev-backup-selection"
  plan_id      = aws_backup_plan.dev_backup_plan.id

  resources = [
    "arn:aws:ec2:${var.region}:${data.aws_caller_identity.current.account_id}:instance/*"
    # "arn:aws:rds:${var.region}:${data.aws_caller_identity.current.account_id}:db/*",
    # "arn:aws:dynamodb:${var.region}:${data.aws_caller_identity.current.account_id}:table/*"
  ]

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Environment"
    value = "dev"
  }
}

resource "aws_iam_role" "backup_role" {
  name = "backup-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "backup.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "backup_role_policy" {
  role       = aws_iam_role.backup_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}

output "backup_vault_name" {
  value = aws_backup_vault.dev_backup_vault.name
}
