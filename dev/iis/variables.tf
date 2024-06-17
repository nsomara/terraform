variable "region" {
  description = "The AWS region to create resources in"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the IIS server"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the IIS server"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for the IIS server"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group to attach to the IIS server"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to place the IIS server in"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the private subnet"
  type        = string
}

variable "windows_bastion_sg_id" {
  description = "The ID of the Windows bastion security group"
  type        = string
}

variable "ssm_instance_profile_name" {
  description = "The name of the SSM instance profile"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}
