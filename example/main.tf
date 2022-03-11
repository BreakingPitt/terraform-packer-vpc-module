module "packer_vpc" {
  source       = "../../packer_vpc/"
  cidr_block   = "10.10.0.0/16"
  environment  = "dev"
  name         = "packer-test-build"
  region       = "eu-central-1"
}
