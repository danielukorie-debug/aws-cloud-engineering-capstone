variable "aws_region" {
  description = "AWS region for the capstone."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the capstone project."
  type        = string
  default     = "aws-cloud-engineering-capstone"
}

variable "vpc_cidr" {
  description = "IPv4 address range for the VPC."
  type        = string
  default     = "10.20.0.0/16"
}

variable "private_subnet_cidr" {
  description = "IPv4 address range for the private subnet."
  type        = string
  default     = "10.20.1.0/24"
}
