variable "region" {
  description = "The AWS region to create resources in"
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

variable "bastion_sg_id" {
  description = "The ID of the bastion security group"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the web server"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the web server"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the key pair to use for the web server"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
