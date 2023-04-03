#? https://github.com/terraform-aws-modules/terraform-aws-iam/tree/master/modules/iam-user#outputs

output "iam_user_summary" {
  value = concat(
    formatlist(
      "%s - %s - %s",
      [for user in module.iam_user : user.iam_user_name],
      [for user in module.iam_user : user.keybase_password_pgp_message],
      [for user in module.iam_user : user.keybase_password_decrypt_command],
    )
  )
}
