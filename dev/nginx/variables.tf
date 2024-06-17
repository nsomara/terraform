variable "region" {
  description = "The AWS region to create resources in"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the Nginx server"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the Nginx server"
  type        = string
}

variable "key_name" {
  description = "The key name for SSH access"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID to assign to the Nginx server"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to deploy the Nginx server in"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the Nginx server will be deployed"
  type        = string
}

variable "private_subnet_id" {
  description = "The private subnet ID for the Nginx server"
  type        = string
}

variable "linux_bastion_sg_id" {
  description = "The security group ID for the Linux bastion host"
  type        = string
}

variable "windows_bastion_sg_id" {
  description = "The security group ID for the Windows bastion host"
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
