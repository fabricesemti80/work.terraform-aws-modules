output "vpc_policy_content" {
  value = aws_organizations_policy.vpc_policy.*.content
}