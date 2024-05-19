provider "aws" {
  alias  = "security"
  region = var.region
  profile = "terraformuser"
  assume_role {
    role_arn = "arn:aws:iam::654654612174:role/TerraformProvisioningRole"
  }
}
