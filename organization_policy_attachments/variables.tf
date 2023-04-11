variable "controlled_resources" {
  description = "Resources that the policy will controll"
  type        = list(string)
  default     = ["*"]
}
variable "controlled_effect" {
  description = "Mode for the policy [allow/deny]"
  type        = string
  default     = "Deny"
  validation {
    condition     = can(regex("^(Allow|Deny)$", var.controlled_effect))
    error_message = "The default_effect field must be either 'Allow' or 'Deny'."
  }
}
variable "controlled_actions" {
  description = "Allowed/denied actions actions"
  type        = list(string)
  default     = ["*"]
}
variable "controlled_condition" {
  description = "AWS operators - see: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_condition_operators.html"
  type        = string
  default     = "StringNotEquals"
  validation {
    condition     = can(index(["StringEquals", "StringNotEquals", "StringEqualsIgnoreCase", "StringNotEqualsIgnoreCase", "NumericEquals", "NumericNotEquals", "NumericLessThan", "NumericLessThanEquals", "NumericGreaterThan", "NumericGreaterThanEquals", "DateEquals", "DateNotEquals", "DateLessThan", "DateLessThanEquals", "DateGreaterThan", "DateGreaterThanEquals", "Bool", "IpAddress", "NotIpAddress", "ArnEquals", "ArnNotEquals", "ArnEqualsIfExists", "ArnLike", "ArnLikeIfExists", "Null"], var.controlled_condition))
    error_message = "The controlled_condition field must be one of the allowed AWS condition operators."
  }
}
variable "controlled_condition_variable" {
  type        = string
  default     = "aws:RequestedRegion"
  description = "Condition keys - see: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_multi-value-conditions.html"
  validation {
    condition     = can(regex("^aws:[A-Za-z0-9_]+$", var.controlled_condition_variable))
    error_message = "The controlled_condition_variable field must be in the format of 'aws:<string>'"
  }
}
variable "controlled_condition_values" {
  type        = list(string)
  default     = ["eu-west-2"]
  description = "Condition values - see: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_multi-value-conditions.html"
  validation {
    condition     = length(var.controlled_condition_values) > 0
    error_message = "The controlled_condition_values field must have at least one value."
  }
}
variable "policy_description" {
  type        = string
  default     = "Deny all actions in on resources not matching to the given ID-s"
  description = "What the policy does"
}
variable "target_ou_ids" {
  type = map(string)
  default = {
    ou1 = "ou-12345"
    ou2 = "ou-67890"
  }
  description = "OU-s to apply the policy to"
}
