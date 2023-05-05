module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.17.1"

  for_each = var.iam_users

  name          = each.key
  force_destroy = each.value.force_destroy

  pgp_key = each.value.pgp_key

  password_reset_required = each.value.password_reset_required
}
