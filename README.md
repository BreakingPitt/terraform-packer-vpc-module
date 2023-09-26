# Terraform AWS VPC Module

This Terraform module creates an AWS Virtual Private Cloud (VPC) that can be used in conjunction with the Packer AMI builder to create Amazon Machine Images (AMIs). The VPC includes essential resources like an Internet Gateway and subnets.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)
- [Authors](#authors)

## Prerequisites

Before using this Terraform module, ensure you have the following prerequisites:

- [Terraform](https://www.terraform.io/) installed (version >= 1.5.2)
- AWS credentials configured for your environment
- Basic understanding of AWS networking concepts

## Usage

To use this module, include it in your Terraform configuration. Here's an example of how to use it:

```hcl
module "vpc" {
  source = "github.com/your-org/terraform-aws-vpc"

  # Customize input variables as needed
  cidr_block       = "10.0.1.0/16"
  enable_flow_log  = false
  name            = "packer"
  namespace       = "Engine9.io"
  stage           = "dev"
  traffic_type    = "ALL"
}

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.6.2 |
| <a name="requirement_http"></a> [http](#requirement\_http) | ~> 3.4.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.5.1 |
| <a name="requirement_time"></a> [time](#requirement\_time) | ~> 0.9.1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.6.2 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.9.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_label"></a> [label](#module\_label) | cloudposse/label/terraform | 0.8.0 |

## Resources

| Name | Type |
|------|------|
| [aws_flow_log.vpc_flow_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_internet_gateway.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [time_static.default](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/static) | resource |
| [aws_availability_zones.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | The IP prefix to the CIDR block assigned to the VPC | `string` | `"10.0.1.0"` | no |
| <a name="input_enable"></a> [enable](#input\_enable) | Flag to control the VPC creation. | `bool` | `true` | no |
| <a name="input_enable_flow_log"></a> [enable\_flow\_log](#input\_enable\_flow\_log) | Enable VPC flow logs. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The VPC name. | `string` | `"packer"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The namespace can be your organization name or abbreviation. | `string` | `"Engine9.io"` | no |
| <a name="input_s3_bucket_arn"></a> [s3\_bucket\_arn](#input\_s3\_bucket\_arn) | ARN of the S3 Bucket used to store the VPC flow logs. | `string` | `""` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | The stage, e.g. 'prod', 'staging', 'dev' | `string` | `""` | no |
| <a name="input_traffic_type"></a> [traffic\_type](#input\_traffic\_type) | Type of traffic to capture. Valid values: ACCEPT, REJECT, ALL. | `string` | `"ALL"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_internet_gateway_id"></a> [internet\_gateway\_id](#output\_internet\_gateway\_id) | The Id of the Internet Gateway. |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | Subnet Id |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC Id |
<!-- END_TF_DOCS -->

## Examples

You can find more usage examples in the [examples](./examples) directory.


## Contributing

Contributions to enhance and expand the lab with new vulnerability scenarios and mitigations are welcome! Please follow ethical guidelines and ensure the examples provided are solely intended for educational purposes.

## License

The content in this repository is licensed under the [MIT License](LICENSE).

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Authors

- Pedro Garcia <pedgarrod@gmail.com>
