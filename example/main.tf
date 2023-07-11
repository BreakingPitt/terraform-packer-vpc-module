module "packer_vpc" {
  source          = "../../terraform-packer-vpc-module/"
  cidr_block      = "10.10.0.0/16"
  enable          = true
  enable_flow_log = false
  stage           = "Dev"
  name            = "packer-test-build"
}
