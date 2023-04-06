output "organizational_units" {
  value = local.all_ou_attributes
}

output "account_ids" {
  value = [for account in aws_organizations_account.account : account.id]
}
