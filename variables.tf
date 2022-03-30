/*
  ----------
  Org Prefix
  ----------
*/

variable "org_prefix" {
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

/*
  -------------------------------------
  Policy Names, Description and Effects
  -------------------------------------
*/

// Allowed Regions
variable "allowed_regions_policy_name" {
  type = string
}

variable "allowed_regions_policy_display_name" {
  type = string
}

variable "allowed_regions_policy_description" {
  type = string
}

variable "allowed_regions_policy_category" {
  type = string
}

variable "allowed_regions_policy_effect" {
  type = string
}

// Allowed Resource Types
variable "allowed_resource_type_policy_name" {
  type = string
}

variable "allowed_resource_type_policy_display_name" {
  type = string
}

variable "allowed_resource_type_policy_description" {
  type = string
}

variable "allowed_resource_type_policy_category" {
  type = string
}

variable "allowed_resource_type_policy_effect" {
  type = string
}

// Allowed SQL version
variable "allowed_sql_version_policy_name" {
  type = string
}

variable "allowed_sql_version_policy_display_name" {
  type = string
}

variable "allowed_sql_version_policy_description" {
  type = string
}

variable "allowed_sql_version_policy_category" {
  type = string
}

variable "allowed_sql_version_policy_effect" {
  type = string
}

// Allowed Storage Account SKU
variable "allowed_storage_account_sku_policy_name" {
  type = string
}

variable "allowed_storage_account_sku_policy_display_name" {
  type = string
}

variable "allowed_storage_account_sku_policy_description" {
  type = string
}

variable "allowed_storage_account_sku_policy_category" {
  type = string
}

variable "allowed_storage_account_SKUs_policy_effect" {
  type = string
}

// Allowed VM Extensions
variable "allowed_vm_extensions_policy_name" {
  type = string
}

variable "allowed_vm_extensions_policy_display_name" {
  type = string
}

variable "allowed_vm_extensions_policy_description" {
  type = string
}

variable "allowed_vm_extensions_policy_category" {
  type = string
}

variable "allowed_vm_extensions_policy_effect" {
  type = string
}

// Allowed VM OS version
variable "allowed_vm_os_version_policy_name" {
  type = string
}

variable "allowed_vm_os_version_policy_display_name" {
  type = string
}

variable "allowed_vm_os_version_policy_description" {
  type = string
}

variable "allowed_vm_os_version_policy_category" {
  type = string
}

variable "allowed_vms_os_version_policy_effect" {
  type = string
}

// Allowed VM SKU
variable "allowed_vm_sku_policy_name" {
  type = string
}

variable "allowed_vm_sku_policy_display_name" {
  type = string
}

variable "allowed_vm_sku_policy_description" {
  type = string
}

variable "allowed_vm_sku_policy_category" {
  type = string
}

variable "allowed_vm_sku_policy_effect" {
  type = string
}

// Key Vault Soft Delete
variable "keys_vault_soft_delete_policy_name" {
  type = string
}

variable "keys_vault_soft_delete_policy_display_name" {
  type = string
}

variable "keys_vault_soft_delete_policy_description" {
  type = string
}

variable "keys_vault_soft_delete_policy_category" {
  type = string
}

variable "keys_vault_soft_delete_policy_effect" {
  type = string
}

// Key Vault Purge Protection
variable "keys_vault_purge_protection_policy_name" {
  type = string
}

variable "keys_vault_purge_protection_policy_display_name" {
  type = string
}

variable "keys_vault_purge_protection_policy_description" {
  type = string
}

variable "keys_vault_purge_protection_policy_category" {
  type = string
}

variable "keys_vault_purge_protection_policy_effect" {
  type = string
}

// Enable Network Watcher
variable "network_watcher_enable_policy_name" {
  type = string
}

variable "network_watcher_enable_policy_display_name" {
  type = string
}

variable "network_watcher_enable_policy_description" {
  type = string
}

variable "network_watcher_enable_policy_category" {
  type = string
}

variable "network_watcher_enable_policy_effect" {
  type = string
}

// NSG for every Subnet
variable "nsg_every_subnet_policy_name" {
  type = string
}

variable "nsg_every_subnet_policy_display_name" {
  type = string
}

variable "nsg_every_subnet_policy_description" {
  type = string
}

variable "nsg_every_subnet_policy_category" {
  type = string
}

variable "nsg_every_subnet_policy_effect" {
  type = string
}

// NSG Inbound Rules
variable "nsg_inbound_rules_policy_name" {
  type = string
}

variable "nsg_inbound_rules_policy_display_name" {
  type = string
}

variable "nsg_inbound_rules_policy_description" {
  type = string
}

variable "nsg_inbound_rules_policy_category" {
  type = string
}

variable "nsg_inbound_rules_policy_effect" {
  type = string
}

// SQL Database Private Endpoint
variable "sql_database_private_endpoint_policy_name" {
  type = string
}

variable "sql_database_private_endpoint_policy_display_name" {
  type = string
}

variable "sql_database_private_endpoint_policy_description" {
  type = string
}

variable "sql_database_private_endpoint_policy_category" {
  type = string
}

variable "sql_database_private_endpoint_policy_effect" {
  type = string
}

// SQL Database TLS version
variable "sql_database_tls_version_policy_name" {
  type = string
}

variable "sql_database_tls_version_policy_display_name" {
  type = string
}

variable "sql_database_tls_version_policy_description" {
  type = string
}

variable "sql_database_tls_version_policy_category" {
  type = string
}

variable "sql_database_tls_version_policy_effect" {
  type = string
}

// SQL Server Network Access
variable "sql_server_network_access_policy_name" {
  type = string
}

variable "sql_server_network_access_policy_display_name" {
  type = string
}

variable "sql_server_network_access_policy_description" {
  type = string
}

variable "sql_server_network_access_policy_category" {
  type = string
}

variable "sql_server_network_access_policy_effect" {
  type = string
}

// SSL Storage Secure Transfer
variable "ssl_storage_secure_transfer_setting_policy_name" {
  type = string
}

variable "ssl_storage_secure_transfer_setting_policy_display_name" {
  type = string
}

variable "ssl_storage_secure_transfer_setting_policy_description" {
  type = string
}

variable "ssl_storage_secure_transfer_setting_policy_category" {
  type = string
}

variable "ssl_storage_secure_transfer_setting_policy_effect" {
  type = string
}

// Storage Account Key Expiry
variable "storage_account_key_expiry_policy_name" {
  type = string
}

variable "storage_account_key_expiry_policy_display_name" {
  type = string
}

variable "storage_account_key_expiry_policy_description" {
  type = string
}

variable "storage_account_key_expiry_policy_category" {
  type = string
}

variable "storage_account_key_expiry_policy_effect" {
  type = string
}

// Storage Account Network Access
variable "storage_account_network_access_policy_name" {
  type = string
}

variable "storage_account_network_access_policy_display_name" {
  type = string
}

variable "storage_account_network_access_policy_description" {
  type = string
}

variable "storage_account_network_access_policy_category" {
  type = string
}

variable "storage_account_network_access_policy_effect" {
  type = string
}

// Mandatory Tags
variable "tags_mandatory_policy_name" {
  type = string
}

variable "tags_mandatory_policy_display_name" {
  type = string
}

variable "tags_mandatory_policy_description" {
  type = string
}

variable "tags_mandatory_policy_category" {
  type = string
}

variable "tags_mandatory_policy_effect" {
  type = string
}

// Optional Tags
variable "tags_optional_policy_name" {
  type = string
}

variable "tags_optional_policy_display_name" {
  type = string
}

variable "tags_optional_policy_description" {
  type = string
}

variable "tags_optional_policy_category" {
  type = string
}

variable "tags_optional_policy_effect" {
  type = string
}

// VM Encryption
variable "vm_encryption_policy_name" {
  type = string
}

variable "vm_encryption_policy_display_name" {
  type = string
}

variable "vm_encryption_policy_description" {
  type = string
}

variable "vm_encryption_policy_category" {
  type = string
}

variable "vm_encryption_policy_effect" {
  type = string
}

// Internet Facig NSG enabled
variable "vm_internet_facing_nsg_policy_name" {
  type = string
}

variable "vm_internet_facing_nsg_policy_display_name" {
  type = string
}

variable "vm_internet_facing_nsg_policy_description" {
  type = string
}

variable "vm_internet_facing_nsg_policy_category" {
  type = string
}

variable "vm_internet_facing_nsg_policy_effect" {
  type = string
}

// VM IP forwarding
variable "vm_ip_forwarding_policy_name" {
  type = string
}

variable "vm_ip_forwarding_policy_display_name" {
  type = string
}

variable "vm_ip_forwarding_policy_description" {
  type = string
}

variable "vm_ip_forwarding_policy_category" {
  type = string
}

variable "vm_ip_forwarding_policy_effect" {
  type = string
}

// VM Managed Disk
variable "vm_managed_disk_policy_name" {
  type = string
}

variable "vm_managed_disk_policy_display_name" {
  type = string
}

variable "vm_managed_disk_policy_description" {
  type = string
}

variable "vm_managed_disk_policy_category" {
  type = string
}

variable "vm_managed_disk_policy_effect" {
  type = string
}

// VM Management Port
variable "vm_management_port_policy_name" {
  type = string
}

variable "vm_management_port_policy_display_name" {
  type = string
}

variable "vm_management_port_policy_description" {
  type = string
}

variable "vm_management_port_policy_category" {
  type = string
}

variable "vm_management_port_policy_effect" {
  type = string
}

// WAF for Application Gateway
variable "waf_application_gateway_policy_name" {
  type = string
}

variable "waf_application_gateway_policy_display_name" {
  type = string
}

variable "waf_application_gateway_policy_description" {
  type = string
}

variable "waf_application_gateway_policy_category" {
  type = string
}

variable "waf_application_gateway_policy_effect" {
  type = string
}

// Key Vault Expiry Status
variable "key_vault_key_expiry_status_policy_effect" {
  type = string
}

/*
  ----------------------------------------------------
  allowed_regions module variable
  ----------------------------------------------------
*/

variable "allowed_regions" {
  description = "List of allowed Azure regions"
  type        = list(string)
}

/*
  ----------------------------------------------------
  allowed_storage_account_SKUs module variable
  ----------------------------------------------------
*/

variable "allowed_storage_account_SKUs" {
  description = "List of allowed storage account SKUs"
  type        = list(string)
}

/*
  ----------------------------------------------------
  allowed_resource_type module variable
  ----------------------------------------------------
*/

variable "allowed_resource_type" {
  description = "List of allowed Azure resource type"
  type        = list(string)
}

/*
  ----------------------------------------------------
  allowed_vms_os_version module variable
  ----------------------------------------------------
*/

// These are WIndows Server SKU from Azure

variable "allowed_windows_os_version" {
  description = "List of allowed Windows OS Versions"
  type        = list(string)
}

// These are Redhat SKU from Azure

variable "allowed_linux_os_version" {
  description = "List of allowed Linux OS Versions"
  type        = list(string)
}

/*
  ----------------------------------------------------
  allowed_vm_extensions module variable
  ----------------------------------------------------
*/

variable "allowed_vm_extensions" {
  description = "List of allowed VM Extensions"
  type        = list(string)
}

/*
  ----------------------------------------------------
  allowed_vms_sku module variable
  ----------------------------------------------------
*/

variable "allowed_vms_sku" {
  description = "List of allowed Virtual machines SKU types"
  type        = list(string)
}

/*
  ----------------------------------------------------
  network_watcher module variable
  ----------------------------------------------------
*/

variable "network_watcher_resource_group_name" {
  description = "List of Effects"
  type        = string
}

/*
  ----------------------------------------------------
  allowed_sql_version module variable
  ----------------------------------------------------
*/

variable "allowed_sql_version" {
  description = "Allowed SQL version"
  type        = string
}

/*
  ------------------------------------
  sql_database_tls_version
  ------------------------------------
*/

variable "sql_database_allowed_tls_version" {
  description = "The allowed value of TLS for SQL Server Database"
  type        = string
}