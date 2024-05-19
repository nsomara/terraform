provider "aws" {
  alias  = "prod"
  region = var.region
  profile = "terraformuser"
  assume_role {
    role_arn = "arn:aws:iam::730335538635:role/TerraformProvisioningRole"
  }
}
