variable "policies" {
  description = "List of policies to create"
  type = map(object({
    effect    = string
    actions   = list(string)
    resources = list(string)
    condition = optional(object({
      test     = string
      variable = string
      values   = list(string)
    }))
    description = string
    target_id   = string
  }))
  default = {
    somepolicy = {
      effect    = "Deny"
      actions   = ["*"]
      resources = ["*"]

      condition = {

        test     = "StringNotEquals"
        variable = "aws:RequestedRegion"

        values = [
          "eu-west-2"
        ]

      }

      description = "Denny all action in EU West 2"
      target_id   = "some_target_id"
    }
  }
}