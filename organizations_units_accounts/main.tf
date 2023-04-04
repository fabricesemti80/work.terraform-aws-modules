resource "aws_organizations_organizational_unit" "spin-aft-ou" {
  name      = var.ou_name
  parent_id = var.org_root_id
}