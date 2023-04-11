data "aws_iam_policy_document" "thispolicy" {
  for_each = var.policies
  statement {
    sid       = each.key
    effect    = each.value.effect
    actions   = each.value.actions
    resources = each.value.resources
    condition {
      test     = each.value.condition.test
      variable = each.value.condition.variable
      values   = each.value.condition.values
    }
  }
}
resource "aws_organizations_policy" "thispolicy" {
  for_each = var.policies
  name        = each.key
  description = each.value.description
  content     = data.aws_iam_policy_document.thispolicy[each.key].json
}
resource "aws_organizations_policy_attachment" "thispolicy_on_root" {
  for_each = var.policies
  policy_id = aws_organizations_policy.thispolicy[each.key].id
  target_id = each.value.target_id
}
