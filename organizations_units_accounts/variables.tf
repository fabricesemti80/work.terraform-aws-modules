variable "org_root_id" {
variable "org_root_id" {
  description = "ROOT org id"
  type        = string
}


variable "org_units" {
  type = object({
    accounts = optional(list(object({
      name                              = string,
      key                               = string,
      email                             = string,
      allow_iam_users_access_to_billing = bool,
    })), [])
    units = optional(list(object({
      name = string,
      key  = string,
      accounts = optional(list(object({
        name                              = string,
        key                               = string,
        email                             = string,
        allow_iam_users_access_to_billing = bool,
      })), [])
      units = optional(list(object({
        name = string,
        key  = string,
        accounts = optional(list(object({
          name                              = string,
          key                               = string,
          email                             = string,
          allow_iam_users_access_to_billing = bool,
        })), [])
        units = optional(list(object({
          name = string,
          key  = string,
          accounts = optional(list(object({
            name                              = string,
            key                               = string,
            email                             = string,
            allow_iam_users_access_to_billing = bool,
          })), [])
          units = optional(list(object({
            name = string,
            key  = string,
            accounts = optional(list(object({
              name                              = string,
              key                               = string,
              email                             = string,
              allow_iam_users_access_to_billing = bool,
            })), [])
            units = optional(list(object({
              name = string,
              key  = string,
              accounts = optional(list(object({
                name                              = string,
                key                               = string,
                email                             = string,
                allow_iam_users_access_to_billing = bool,
              })), [])
            })))
          })), [])
        })), [])
      })), [])
    })), [])
  })
  default     = {}
  nullable    = false
  description = "The organization with the tree of organizational units and accounts to construct. Defaults to an object with an empty list of units and accounts"
}