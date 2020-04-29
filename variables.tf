# ----------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------

variable "tf_env" {
  description = "Just an identifier that will be used in GCP resource names. Will help us distinguish resources created by Terraform versus resources that were already created before Terraform."
  type        = string
  validation {
    condition     = length(var.tf_env) <= 10
    error_message = "A max of 10 character(s) are allowed."
  }
}

variable "account_id" {
  description = "Will be used as part of the username-portion of email address generated for the service account."
  type        = string
  validation {
    condition     = length(var.account_id) <= 25
    error_message = "A max of 25 characters is allowed."
  }
}

variable "display_name" {
  description = "A mutable name for the service account."
  type        = string
}

# ----------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------

variable "description" {
  description = "The description of the service account."
  type        = string
  default     = "Generated by Terraform"
}

variable "roles" {
  description = "IAM roles to be added to the service account. See https://cloud.google.com/iam/docs/understanding-roles."
  type        = list(string)
  default     = []
}

variable "module_depends_on" {
  description = "Create explicit dependency of this module on values from other modules(s) and/or resource(s)."
  type        = list(string)
  default     = []
}