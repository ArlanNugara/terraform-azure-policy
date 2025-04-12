// Azure Policy Definition Variables

variable "definition_name" {
  type        = string
  description = "Policy Definition Name"
}

variable "definition_mode" {
  type        = string
  description = "Policy Definition Mode"
  default     = "Indexed"
}

variable "definition_display_name" {
  type        = string
  description = "Policy Definition Display Name"
}

variable "definition_metadata" {
  type        = string
  description = "Policy Definition Metadata"
}

variable "definition_policy_rule" {
  type        = string
  description = "Policy Definition Rule"
}

variable "definition_parameters" {
  type        = string
  description = "Policy Definition Parameters"
  default     = "{}"
}

variable "mg_id" {
  type        = string
  description = "Policy Definition Management Group ID"
}