// Log Analytics Workspace Variables

variable "law_name" {
  type        = string
  description = "Log Analytics Workspace Name"
}

variable "law_location" {
  type        = string
  description = "Log Analytics Workspace Location"
}

variable "law_rg_name" {
  type        = string
  description = "Log Analytics Workspace Resource Group Name"
}

variable "law_sku" {
  type        = string
  description = "Log Analytics Workspace SKU"
  default     = "PerGB2018"
}

variable "law_retension_days" {
  type        = number
  description = "Log Retension in Days"
  default     = 30
}

variable "law_daily_quota" {
  type        = number
  description = "Log Daily Quota in GB"
  default     = 1
}

variable "default_tags" {
  type        = map(string)
  description = "Default Tags"
}