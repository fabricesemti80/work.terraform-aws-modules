#? refer to https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest?tab=inputs for variables!

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  for_each = var.vpcs

  name          = each.key
  cidr  = each.value.cidr
  azs = each.value.azs
  private_subnets = each.value.private_subnets
}