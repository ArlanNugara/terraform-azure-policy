// Azure Policy Assignment Variables

variable "policy_assignment_name" {
  type        = string
  description = "Policy Assignment Name"
}

variable "policy_assignment_display_name" {
  type        = string
  description = "Policy Assignment Display Name"
}

variable "definition_id" {
  type        = string
  description = "Policy Definition ID "
}

variable "mg_id" {
  type        = string
  description = "Management Group ID"
}

variable "policy_assignment_param" {
  type        = string
  description = "Policy Assignment Parameters"
  default     = "{}"
}

variable "policy_assignment_location" {
  type        = string
  description = "Policy Assignment Location"
}