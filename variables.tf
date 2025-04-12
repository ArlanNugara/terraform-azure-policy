// Variables

# Common

variable "mg_identification" {
  type        = string
  description = "Top Level Management Group Short Name"
}

variable "mg_id" {
  type        = string
  description = "Management Group ID"
}

variable "location" {
  type        = string
  description = "Azure Resource Location"
}

# Shared Resources

variable "default_tags" {
  type        = map(string)
  description = "Default Tags"
}

# Diagnostics Policy

variable "alllogs_diag_policy_set_def_display_name" {
  type        = string
  description = "All Logs Diagnostics Policy Set Definition Display Name"
}

variable "alllogs_diag_policy_assignment_display_name" {
  type        = string
  description = "All Logs Diagnostics Policy Assignment Display Name"
}

variable "sa_def_set_display_name" {
  type        = string
  description = "Storage Account Policy Definition Set Display Name"
}

variable "sa_diag_assignment_display_name" {
  type        = string
  description = "Storage Account Policy Assignment Display Name"
}

# Monitoring Policy

variable "action_group_name" {
  type        = string
  description = "Action Group Name"
}

variable "action_group_short_name" {
  type        = string
  description = "Action Group Short Name"
}

variable "action_group_email" {
  type        = string
  description = "Action Group Email"
}

variable "monitoring_def_set_display_name" {
  type        = string
  description = "Monitoring Policy Definition Set Display name"
}

variable "monitoring_assignment_display_name" {
  type        = string
  description = "Monitoring Policy Definition Set Display name"
}

variable "grafana_name" {
  type        = string
  description = "Grafana Instance Name"
}

# VM Insights

variable "vm_insight_assignment_display_name" {
  type        = string
  description = "VM Insight Assignment Display Name"
}

# VM Change Tracking

# variable "vm_change_tracking_policy_display_name" {
#   type        = string
#   description = "Change Tracking Policy Assignment Display Name"
# }

# VM MDE

variable "vm_mde_policy_display_name" {
  type        = string
  description = "VM MDE Assignment Display Name"
}

# VM Dependency Agent

variable "vm_dependency_agent_policy_display_name" {
  type        = string
  description = "VM Dependency Agent Policy Assignment Display Name"
}

# VM Guest Config

variable "vm_guest_config_policy_display_name" {
  type        = string
  description = "VM Guest Config Policy Assignment Display Name"
}

# VM Iaas Antimalware Config

variable "vm_iaas_antimalware_policy_display_name" {
  type        = string
  description = "VM Iaas Antimalware Policy Assignment Display Name"
}

# VM Active Directory Join

variable "vm_aad_join_policy_display_name" {
  type        = string
  description = "VM Active Directory Join Policy Assignment Display Name"
}

# General Policy

variable "gen_policy_display_name" {
  type        = string
  description = "General Policy Display Name"
}

variable "gen_allowed_loc_effect" {
  type        = string
  description = "Allowed Locations Effect"
}

variable "gen_allowed_loc" {
  type        = list(string)
  description = "Allowed Locations"
}

variable "gen_allowed_res_effect" {
  type        = string
  description = "Allowed Resources Effect"
}

variable "gen_allowed_res" {
  type        = list(string)
  description = "Allowed Resources"
}

# Network Policy

variable "net_policy_display_name" {
  type        = string
  description = "Network Policy Display Name"
}

variable "net_allowed_vnet_pip_effect" {
  type        = string
  description = "Allowed VNET for Public IP Policy Effect"
}

variable "net_allowed_vnet_pip" {
  type        = list(string)
  description = "Allowed Virtual Networks"
}

# Compute Policy

variable "comp_policy_display_name" {
  type        = string
  description = "Compute Policy Display Name"
}

variable "win_os_version" {
  type        = list(string)
  description = "List of Allowed Windows OS Versions"
}

variable "lnx_os_version" {
  type        = list(string)
  description = "List of Allowed Linux OS Versions"
}

variable "comp_allowed_os_effect" {
  type        = string
  description = "Allowed VM OS Policy Effect"
}

variable "comp_allowed_extensions" {
  type        = list(string)
  description = "List of Allowed VM Extensions"
}

variable "comp_allowed_sku" {
  type        = list(string)
  description = "List of Allowed VM SKU"
}

variable "comp_allowed_sku_effect" {
  type        = string
  description = "Allowed VM SKU Policy Effect"
}

# Storage Policy

variable "stor_policy_display_name" {
  type        = string
  description = "Storage Policy Display Name"
}

variable "stor_allowed_sku_effect" {
  type        = string
  description = "Allowed Storage Account SKU Effect"
}

variable "stor_allowed_sku" {
  type        = list(string)
  description = "List of Storage Account SKU"
}

# Tags Policy

variable "req_tags_policy_display_name" {
  type        = string
  description = "Required Tags Policy Display name"
}

variable "opt_tags_policy_display_name" {
  type        = string
  description = "Optional Tags Policy Display name"
}

variable "req_tags_effect" {
  type        = string
  description = "Required Tags Effect"
}

variable "opt_tags_effect" {
  type        = string
  description = "Optional Tags Effect"
}

variable "required_tags" {
  type        = set(string)
  description = "List of Required Tags Key"
}

variable "optional_tags" {
  type        = set(string)
  description = "List of Optional tags Key"
}

# Database Policy

variable "mysql_policy_display_name" {
  type        = string
  description = "MySQL Policy Display Name"
}

variable "psql_policy_display_name" {
  type        = string
  description = "PSQL Policy Display Name"
}

variable "sql_policy_display_name" {
  type        = string
  description = "SQL Policy Display Name"
}

# Data Factory Policy

variable "adf_max_cores" {
  type        = number
  description = "Data Factory Max Cores"
}

variable "adf_policy_display_name" {
  type        = string
  description = "Data Factory Policy Display Name"
}

variable "adf_linked_service_resource_type" {
  type        = list(string)
  description = "Data Factory Linked Service Resource Type"
}

# Databricks Policy

variable "dbw_log_retension_days" {
  type        = string
  description = "Databricks Logs Retension Days"
}

variable "dbw_policy_display_name" {
  type        = string
  description = "Databricks Policy Display Name"
}

# Synapse Policy

variable "syn_policy_display_name" {
  type        = string
  description = "Synapse Policy Display Name"
}