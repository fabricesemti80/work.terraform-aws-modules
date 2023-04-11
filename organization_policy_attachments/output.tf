output "policy_summary" {
  value = concat(
    formatlist(
      "%s - %s",
      values(aws_organizations_policy.thispolicy).*.name,
      values(aws_organizations_policy.thispolicy).*.id,

    )
  )
}
