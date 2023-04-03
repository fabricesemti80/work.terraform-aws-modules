#? https://github.com/terraform-aws-modules/terraform-aws-iam/tree/master/modules/iam-user#outputs


output "iam_user_names" {
  value = values(module.iam_user).*.iam_user_name
}

output "iam_user_arns" {
  value = values(module.iam_user).*.iam_user_arn
}

output "iam_user_unique_ids" {
    value = values(module.iam_user).*.iam_user_unique_id
}


output "iam_user_summary" {
  value = concat(
    formatlist(
      "To return password of user %s run: %s",
      [for user in module.iam_user : user.iam_user_name],
      [for user in module.iam_user : user.keybase_password_decrypt_command],
    )
  )
}


/* output "user_names" {
  value = keys(module.iam_user)
} */

/* output "iam_user_summary" {
  value = formatlist(
    "To return password of user %s run: %s",
    [for user in module.iam_user : user.iam_user_name],
    [for user in module.iam_user : user.keybase_password_decrypt_command],
  )
} */

output "iam_user_summary_map" {
  value = zipmap([for user in module.iam_user : user.iam_user_name], [for user in module.iam_user : user.keybase_password_decrypt_command])
}
