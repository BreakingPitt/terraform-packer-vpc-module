output "internet_gateway_id" {
  value       = join("", aws_internet_gateway.default[*].id)
  description = "The Id of the Internet Gateway."
}


output "subnet_id" {
  value       = join("", aws_subnet.default[*].id)
  description = "Subnet Id"
}


output "vpc_cidr_block" {
  value       = join("", aws_vpc.default[*].cidr_block)
  description = "The CIDR block of the VPC."
}


output "vpc_id" {
  value       = join("", aws_vpc.default[*].id)
  description = "VPC Id"
}

