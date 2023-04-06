variable "vpcs" {
  description = "List of VPCs to create"
  type = map(object({
    cidr            = string
    azs             = list(string)
    private_subnets = list(string)
  }))
  default = {
    dummy-vpc-0 = {
      cidr            = "10.0.0.16"
      azs             = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
      private_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
    }
  }
}
