data "aws_iam_policy_document" "thispolicy" {
  for_each = toset( var.target_ou_ids) #var.target_ou_ids
  statement {
    sid       = "${each.key}-policy-${var.controlled_effect}}"
    effect    = var.controlled_effect
    actions   = var.controlled_actions
    resources = var.controlled_resources
    condition {
      test     = var.controlled_condition
      variable = var.controlled_condition_variable
      values   = var.controlled_condition_values
    }
  }
}
resource "aws_organizations_policy" "thispolicy" {
  for_each = toset( var.target_ou_ids)
  name = "${each.key}-policy-${var.controlled_effect}}"
  description = var.policy_description
  content     = data.aws_iam_policy_document.thispolicy[each.key].json
}
resource "aws_organizations_policy_attachment" "thispolicy_on_root" {
  for_each = toset( var.target_ou_ids)
  policy_id = aws_organizations_policy.thispolicy[each.key].id
  target_id = each.key
}
