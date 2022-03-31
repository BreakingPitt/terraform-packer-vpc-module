variable "cidr_block" {
  default     = "10.0.1.0"
  description = "The IP prefix to the CIDR block assigned to the VPC"
  type        = string
}


variable "enable" {
  default     = true
  description = "Flag to control the VPC creation."
  type        = bool
}


variable "enable_flow_log" {
  default     = false
  description = "Enable VPC flow logs."
  type        = bool
}


variable "name" {
  default     = "packer"
  description = "The VPC name."
  type        = string
}


variable "namespace" {
  default     = "Engine9.io"
  description = "The namespace can be your organization name or abbreviation."
  type        = string
}


variable "s3_bucket_arn" {
  default     = ""
  description = "ARN of the S3 Bucket used to store the VPC flow logs."
  sensitive   = true
  type        = string
}


variable "stage" {
  default     = ""
  description = "The stage, e.g. 'prod', 'staging', 'dev'"
  sensitive   = true
  type        = string
}


variable "traffic_type" {
  default     = "ALL"
  description = "Type of traffic to capture. Valid values: ACCEPT, REJECT, ALL."
  type        = string
}
