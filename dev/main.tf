module "vpc" {
  source = "./vpc"
  providers = {
    aws = aws.dev
  }
  region              = var.region
  cidr_block          = var.vpc_cidr_block
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
  tags                = var.tags
  vpc_name            = var.vpc_name
}

module "bastion" {
  source = "./bastion"
  providers = {
    aws = aws.dev
  }
  region            = var.region
  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnet_id
  ami_id            = var.bastion_ami_id
  instance_type     = var.bastion_instance_type
  key_name          = var.bastion_key_name
  tags              = var.tags
}

module "web_server" {
  source = "./web_server"
  providers = {
    aws = aws.dev
  }
  region            = var.region
  vpc_id            = module.vpc.vpc_id
  private_subnet_id = module.vpc.private_subnet_id
  bastion_sg_id     = module.bastion.bastion_sg_id
  ami_id            = var.web_ami_id
  instance_type     = var.web_instance_type
  key_name          = var.web_key_name
  tags              = var.tags
}
