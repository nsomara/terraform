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

# Create VPC
resource "aws_vpc" "dev_vpc" {
  cidr_block = var.cidr_block
  tags = merge(var.tags, { Name = var.vpc_name })
}

# Create Internet Gateway
resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id
  tags   = merge(var.tags, { Name = "${var.vpc_name}-igw" })
}

# Create Public Subnet
resource "aws_subnet" "dev_public_subnet" {
  vpc_id            = aws_vpc.dev_vpc.id
  cidr_block        = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = var.availability_zone
  tags             = merge(var.tags, { Name = "${var.vpc_name}-public-subnet" })
}

# Create Private Subnet
resource "aws_subnet" "dev_private_subnet" {
  vpc_id            = aws_vpc.dev_vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone
  tags             = merge(var.tags, { Name = "${var.vpc_name}-private-subnet" })
}

# Create Public Route Table
resource "aws_route_table" "dev_public_rt" {
  vpc_id = aws_vpc.dev_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_igw.id
  }
  tags = merge(var.tags, { Name = "${var.vpc_name}-public-rt" })
}

# Associate Public Route Table with Public Subnet
resource "aws_route_table_association" "dev_public_rt_assoc" {
  subnet_id      = aws_subnet.dev_public_subnet.id
  route_table_id = aws_route_table.dev_public_rt.id
}

# Create Private Route Table
resource "aws_route_table" "dev_private_rt" {
  vpc_id = aws_vpc.dev_vpc.id
  tags   = merge(var.tags, { Name = "${var.vpc_name}-private-rt" })
}

# Associate Private Route Table with Private Subnet
resource "aws_route_table_association" "dev_private_rt_assoc" {
  subnet_id      = aws_subnet.dev_private_subnet.id
  route_table_id = aws_route_table.dev_private_rt.id
}
