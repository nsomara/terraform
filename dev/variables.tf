variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "The availability zone to create the subnets in"
  type        = string
  default     = "us-west-2a"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    Environment = "dev"
  }
}

variable "vpc_name" {
  description = "The name to apply to the VPC and related resources"
  type        = string
  default     = "dev-vpc"
}

variable "bastion_ami_id" {
  description = "The AMI ID for the bastion host"
  type        = string
  default     = "ami-01cd4de4363ab6ee8"
}

variable "bastion_instance_type" {
  description = "The instance type for the bastion host"
  type        = string
  default     = "t2.micro"
}

variable "bastion_key_name" {
  description = "The name of the key pair to use for the bastion host"
  type        = string
  default     = "Bastion_Dev"
}

variable "web_ami_id" {
  description = "The AMI ID for the web server"
  type        = string
  default     = "ami-01cd4de4363ab6ee8"
}

variable "web_instance_type" {
  description = "The instance type for the web server"
  type        = string
  default     = "t2.micro"
}

variable "web_key_name" {
  description = "The name of the key pair to use for the web server"
  type        = string
  default     = "Web_Dev"
}

variable "windows_bastion_ami_id" {
  description = "The AMI ID for the Windows bastion host"
  type        = string
  default     = "ami-0c0ec0a3a3a4c34c0" # Replace with an actual Windows AMI ID
}

variable "windows_bastion_instance_type" {
  description = "The instance type for the Windows bastion host"
  type        = string
  default     = "t2.micro"
}

variable "windows_bastion_key_name" {
  description = "The name of the key pair to use for the Windows bastion host"
  type        = string
  default     = "Windows_Bastion_Dev"
}

variable "nginx_ami_id" {
  description = "The AMI ID for the Nginx server"
  type        = string
  default     = "ami-01cd4de4363ab6ee8" # Replace with an actual Nginx AMI ID
}

variable "nginx_instance_type" {
  description = "The instance type for the Nginx server"
  type        = string
  default     = "t2.micro"
}

variable "nginx_key_name" {
  description = "The name of the key pair to use for the Nginx server"
  type        = string
  default     = "Nginx_Dev"
}

variable "iis_ami_id" {
  description = "The AMI ID for the Windows IIS server"
  type        = string
  default     = "ami-01cd4de4363ab6ee8" # Replace with an actual Windows AMI ID
}

variable "iis_instance_type" {
  description = "The instance type for the IIS server"
  type        = string
  default     = "t2.micro"
}

variable "iis_key_name" {
  description = "The name of the key pair to use for the IIS server"
  type        = string
  default     = "IIS_Dev"
}
