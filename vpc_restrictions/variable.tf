variable "allowed_vpc_ids" {
  type = list(string)
  default = [
    "vpc-12345678",
    "vpc-87654321"
  ]
}
variable "target_org_unit" {
    type = string
    default = "root"
    description = "(optional) describe your variable"
}