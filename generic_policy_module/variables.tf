variable "policy_definition_name" {
  type        = string
  description = "Policy definition name"
}

variable "policy_definition_display_name" {
  type        = string
  description = "Policy definition display name"
}

variable "policy_definition_description" {
  type        = string
  description = "Policy definition description"
}

variable "policy_definition_metadata" {
  type        = string
  description = "Policy definition metadata"
}

variable "policy_definition_rule" {
  type        = string
  description = "Policy definition rule"
}

variable "policy_definition_parameters" {
  type        = string
  default     = "{}"
  description = "Policy definition parameters"
}

variable "policy_management_scope" {
  description = "Scope for Policy Definitions"
  type        = string
  default     = "alvarnet-mg"
}