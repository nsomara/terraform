provider "aws" {
  alias  = "dev"
  region = var.region
  profile = "terraformuser"
  assume_role {
    role_arn = "arn:aws:iam::992382446249:role/TerraformProvisioningRole"
  }
}
