################################################################
# RDS
################################################################
variable "db_instance_type" {
  type        = string
  description = "DB instance type"

  validation {
    condition = can(
      regex("^db.((($instance_families)\\.($instance_subtypes))|serverless)$",
      var.db_instance_type)
    )
    error_message = "db_instance_type not valid."
  }
}
