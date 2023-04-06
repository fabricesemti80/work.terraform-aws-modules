output "organizational_units" {
  value = local.all_ou_attributes
}

output "account_ids" {
  value = [for account in aws_organizations_account.account : account.id]
}

output "level_1_ou_ids" {
  value = [for ou in aws_organizations_organizational_unit.level_1_ous : ou.id]
}

output "level_2_ou_ids" {
  value = [for ou in aws_organizations_organizational_unit.level_2_ous : ou.id]
}