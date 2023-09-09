##########################################################################
# ACCOUNT
#
# https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-identifiers.html
#
##########################################################################
variable "account_id" {
  type        = string
  description = "Account id"

  validation {
    condition     = try(length(var.account_id) == 12, false)
    error_message = "account_id not valid."
  }
}

variable "account_canonical_id" {
  type        = number
  description = "Account id"

  validation {
    condition     = can(regex("^[a-f0-9]{64}$", var.account_canonical_id))
    error_message = "account_canonical_id not valid."
  }
}
