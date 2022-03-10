variable "cidr_prefix" {
  default     = "10.72"
  description = "The IP prefix to the CIDR block assigned to the VPC"
  type        = string
}

variable "environment" {
  description = "Environment tag"
  type        = string
}

variable "name" {
  default     = "packer"
  description = "The name of the image build environment"
  type        = string
}

variable "region" {
  default     = "eu-west-1"
  description = "The AWS region to deploy to"
  type        = string
}
