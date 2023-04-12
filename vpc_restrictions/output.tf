output "vpc_policy_content" {
  value = aws_organizations_policy.denied_vpc_policy.content
}
