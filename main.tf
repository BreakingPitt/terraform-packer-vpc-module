resource "time_static" "default" {}


module "label" {
  source = "cloudposse/label/terraform"
  version = "0.8.0"

  enabled = true
  namespace  = var.namespace
  name       = var.name
  stage      = var.stage
  delimiter  = "-"

  tags = {
    "Created_by"    = "Terraform",
    "Creation_date" = time_static.default.rfc3339,
    "Deployed_by"   = "Terraform"
  }
}


resource "aws_vpc" "default" {
  count                = var.enable ? 1 : 0
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true

  tags = module.label.tags
}


resource "aws_flow_log" "vpc_flow_log" {
  count = var.enable && var.enable_flow_log == true ? 1 : 0

  log_destination      = var.s3_bucket_arn
  log_destination_type = "s3"
  traffic_type         = var.traffic_type
  vpc_id               = join("", aws_vpc.default.*.id)
}


resource "aws_internet_gateway" "default" {
  count  = var.enable ? 1 : 0
  vpc_id = join("", aws_vpc.default.*.id)

  tags = module.label.tags
}


resource "aws_route_table" "default" {
  vpc_id = join("", aws_vpc.default.*.id)

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = join("", aws_internet_gateway.default.*.id)
  }

  tags = module.label.tags
}


resource "aws_subnet" "default" {
  availability_zone       = element(data.aws_availability_zones.default.names, 0)
  vpc_id                  = join("", aws_vpc.default.*.id)
  cidr_block              = var.cidr_block
  map_public_ip_on_launch = true

  tags = module.label.tags
}


resource "aws_route_table_association" "default" {
  subnet_id      = aws_subnet.default.id
  route_table_id = aws_route_table.default.id
}
