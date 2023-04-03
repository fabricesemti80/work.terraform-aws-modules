variable "iam_users" {
  description = "List of IAM users to create"
  type = map(object({
    force_destroy           = bool
    pgp_key                 = string
    password_reset_required = bool
    permissions_boundary = string
  }))
  default = {
    user1 = {
      force_destroy           = false
      pgp_key                 = "keybase:youruser"
      password_reset_required = true
      permissions_boundary = ""
    },
    user2 = {
      force_destroy           = false
      pgp_key                 = "keybase:youruser"
      password_reset_required = true
      permissions_boundary = ""
    }
  }
}
