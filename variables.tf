/*
  ----------
  Org Prefix
  ----------
*/

variable "client" {
  type        = string
  description = "Organization Name Prefix"
}

/*
  ---------------
  scope of policy
  ---------------
*/

variable "policy_management_scope" {
  description = "Scope for Policy Definitions"
  type        = string
}

variable "initiative_management_scope" {
  description = "Scope for Policy Initiatives"
  type        = string
}