output "organizational_units" {
  value = local.all_ou_attributes
}

output "organizational_unit_ids" {
  value = [
    for unit in aws_organizations_organizational_unit.ou : unit.id
  ]
}


output "account_ids" {
  value = [for account in aws_organizations_account.account : account.id]
}
