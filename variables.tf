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

// Adaptive network hardening recommendations should be applied on internet facing virtual machines
variable "adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy_effect" {
  type = string
}

// Private endpoint should be configured for Key Vault
variable "private_endpoint_should_be_configured_for_key_vault_policy_effect" {
  type = string
}

// Management ports should be closed on your virtual machines
variable "management_ports_should_be_closed_on_your_virtual_machines_policy_effect" {
  type = string
}

// Management ports of virtual machines should be protected with just-in-time network access control
variable "management_ports_of_virtual_machines_should_be_protected_with_just_in_time_network_access_control_policy_effect" {
  type = string
}

// All Internet traffic should be routed via your deployed Azure Firewall
variable "all_internet_traffic_should_be_routed_via_your_deployed_azure_firewall_policy_effect" {
  type = string
}

// IP Forwarding on your virtual machine should be disabled
variable "ip_forwarding_on_your_virtual_machine_should_be_disabled_policy_effect" {
  type = string
}

// Azure DDoS Protection Standard should be enabled
variable "azure_ddos_protection_standard_should_be_enabled_policy_effect" {
  type = string
}

// Web Application Firewall (WAF) should be enabled for Application Gateway
variable "web_application_firewall_should_be_enabled_for_application_gateway_policy_effect" {
  type = string
}

// Azure Web Application Firewall should be enabled for Azure Front Door entry-points
variable "web_application_firewall_should_be_enabled_for_azure_front_door_entry_points_policy_effect" {
  type = string
}

// Latest TLS version should be used in your Web App
variable "latest_tls_version_should_be_used_in_your_web_app_policy_effect" {
  type = string
}

// Latest TLS version should be used in your API App
variable "latest_tls_version_should_be_used_in_your_api_app_policy_effect" {
  type = string
}

// Latest TLS version should be used in your Function App
variable "latest_tls_version_should_be_used_in_your_function_app_policy_effect" {
  type = string
}

// Azure Defender for DNS should be enabled
variable "azure_defender_for_dns_should_be_enabled_policy_effect" {
  type = string
}

// An Azure Active Directory administrator should be provisioned for SQL servers
variable "an_azure_active_directory_administrator_should_be_provisioned_for_sql_servers_policy_effect" {
  type = string
}

// Service Fabric clusters should only use Azure Active Directory for client authentication
variable "service_fabric_clusters_should_only_use_azure_active_directory_for_client_authentication_policy_effect" {
  type = string
}

// Managed identity should be used in your Web App
variable "managed_identity_should_be_used_in_your_web_app_policy_effect" {
  type = string
}

// Managed identity should be used in your Function App
variable "managed_identity_should_be_used_in_your_function_app_policy_effect" {
  type = string
}

// Managed identity should be used in your API App
variable "managed_identity_should_be_used_in_your_api_app_policy_effect" {
  type = string
}

// Virtual machines' Guest Configuration extension should be deployed with system-assigned managed identity
variable "virtual_machines_guest_configuration_extension_should_be_deployed_with_system_assigned_managed_identity_policy_effect" {
  type = string
}

// Authentication to Linux machines should require SSH keys
variable "authentication_to_linux_machines_should_require_ssh_keys_policy_effect" {
  type = string
}

// MFA should be enabled on accounts with read permissions on your subscription
variable "mfa_should_be_enabled_on_accounts_with_read_permissions_on_your_subscription_policy_effect" {
  type = string
}

// MFA should be enabled accounts with write permissions on your subscription
variable "mfa_should_be_enabled_accounts_with_write_permissions_on_your_subscription_policy_effect" {
  type = string
}

// MFA should be enabled on accounts with owner permissions on your subscription
variable "mfa_should_be_enabled_on_accounts_with_write_owner_permissions_on_your_subscription_policy_effect" {
  type = string
}

// A maximum of 3 owners should be designated for your subscription
variable "a_maximum_of_3_owners_should_be_designated_for_your_subscription_policy_effect" {
  type = string
}

// External accounts with owner permissions should be removed from your subscription
variable "external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy_effect" {
  type = string
}

// There should be more than one owner assigned to your subscription
variable "there_should_be_more_than_one_owner_assigned_to_your_subscription_policy_effect" {
  type = string
}

// Deprecated accounts with owner permissions should be removed from your subscription
variable "deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy_effect" {
  type = string
}

// External accounts with read permissions should be removed from your subscription
variable "external_accounts_with_read_permissions_should_be_removed_from_your_subscription_policy_effect" {
  type = string
}

// Deprecated accounts should be removed from your subscription
variable "deprecated_accounts_should_be_removed_from_your_subscription_policy_effect" {
  type = string
}

// External accounts with write permissions should be removed from your subscription
variable "external_accounts_with_write_permissions_should_be_removed_from_your_subscription_policy_effect" {
  type = string
}

// Role-Based Access Control (RBAC) should be used on Kubernetes Services
variable "role_Based_access_control_should_be_used_on_kubernetes_services_policy_effect" {
  type = string
}

// Audit usage of custom RBAC rules
variable "audit_usage_of_custom_rbac_rules_policy_effect" {
  type = string
}

// Azure Defender for SQL should be enabled for unprotected SQL Managed Instances
variable "azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy_effect" {
  type = string
}

// Azure Defender for open-source relational databases should be enabled
variable "azure_defender_for_open_source_relational_databases_should_be_enabled_policy_effect" {
  type = string
}

// Azure Defender for SQL servers on machines should be enabled
variable "azure_defender_for_sql_servers_on_machines_should_be_enabled_policy_effect" {
  type = string
}

// Azure Defender for Azure SQL Database servers should be enabled
variable "azure_defender_for_azure_sql_database_servers_should_be_enabled_policy_effect" {
  type = string
}

// Azure Defender for Storage should be enabled
variable "azure_defender_for_storage_should_be_enabled_policy_effect" {
  type = string
}

// Secure transfer to storage accounts should be enabled
variable "secure_transfer_to_storage_accounts_should_be_enabled_policy_effect" {
  type = string
}

// FTPS only should be required in your Function App
variable "ftps_only_should_be_required_in_your_function_app_policy_effect" {
  type = string
}

// FTPS should be required in your Web App
variable "ftps_should_be_required_in_your_web_app_policy_effect" {
  type = string
}

// Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources
variable "virtual_machines_should_encrypt_temp_disks_caches_and_data_flows_between_compute_and_storage_resources_policy_effect" {
  type = string
}

// Automation account variables should be encrypted
variable "automation_account_variables_should_be_encrypted_policy_effect" {
  type = string
}

// Service Fabric clusters should have the ClusterProtectionLevel property set to EncryptAndSign
variable "service_fabric_clusters_should_have_the_cluster_protection_level_property_set_to_encrypt_and_sign_policy_effect" {
  type = string
}

// Transparent Data Encryption on SQL databases should be enabled
variable "transparent_data_encryption_on_sql_databases_should_be_enabled_policy_effect" {
  type = string
}

// Key Vault keys should have an expiration date
variable "key_vault_keys_should_have_an_expiration_date_policy_effect" {
  type = string
}

// Key Vault secrets should have an expiration date
variable "key_vault_secrets_should_have_an_expiration_date_policy_effect" {
  type = string
}

// Certificates should have the specified maximum validity period
variable "certificates_should_have_the_specified_maximum_validity_period_policy_effect" {
  type = string
}

// Resource logs in Key Vault should be enabled
variable "resource_logs_in_key_vault_should_be_enabled_policy_effect" {
  type = string
}

// Azure Key Vault should disable public network access
variable "azure_key_vault_should_disable_public_network_access_policy_effect" {
  type = string
}

// Key vaults should have purge protection enabled
variable "key_vaults_should_have_purge_protection_enabled_policy_effect" {
  type = string
}

// Azure Defender for Key Vault should be enabled
variable "azure_defender_for_key_vault_should_be_enabled_policy_effect" {
  type = string
}

// Storage accounts should be migrated to new Azure Resource Manager resources
variable "storage_accounts_should_be_migrated_to_new_azure_resource_ranager_resources_policy_effect" {
  type = string
}

// Virtual machines should be migrated to new Azure Resource Manager resources
variable "virtual_machines_should_be_migrated_to_new_azure_resource_ranager_resources_policy_effect" {
  type = string
}

// Azure Defender for Resource Manager should be enabled
variable "azure_defender_for_resource_manager_should_be_enabled_policy_effect" {
  type = string
}

// Resource logs in Logic Apps should be enabled
variable "resource_logs_in_logic_apps_should_be_enabled_policy_effect" {
  type = string
}

// Resource logs in App Services should be enabled
variable "resource_logs_in_app_services_should_be_enabled_policy_effect" {
  type = string
}

// Resource logs in Service Bus should be enabled
variable "resource_logs_in_service_bus_should_be_enabled_policy_effect" {
  type = string
}

// Resource logs in Azure Stream Analytics should be enabled
variable "resource_logs_in_azure_stream_analytics_should_be_enabled_policy_effect" {
  type = string
}

// Log Analytics agent should be installed on your virtual machine for Azure Security Center monitoring
variable "log_analytics_agent_should_be_installed_on_your_virtual_machine_for_azure_security_center_monitoring_policy_effect" {
  type = string
}

// Auto provisioning of the Log Analytics agent should be enabled on your subscription
variable "auto_provisioning_of_the_log_analytics_agent_should_be_enabled_on_your_subscription_policy_effect" {
  type = string
}

// Linux machines should have Log Analytics agent installed on Azure Arc
variable "linux_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy_effect" {
  type = string
}

// Log Analytics agent should be installed on your virtual machine scale sets for Azure Security Center monitoring
variable "log_analytics_agent_should_be_installed_on_your_virtual_machine_scale_sets_for_azure_security_center_monitoring_policy_effect" {
  type = string
}

// Windows machines should have Log Analytics agent installed on Azure Arc
variable "windows_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy_effect" {
  type = string
}

// SQL servers with auditing to storage account destination should be configured with 90 days retention or higher
variable "sql_servers_with_auditing_to_storage_account_destination_should_be_configured_with_90_days_retention_or_higher_policy_effect" {
  type = string
}

// Email notification to subscription owner for high severity alerts should be enabled
variable "email_notification_to_subscription_owner_for_high_severity_alerts_should_be_enabled_policy_effect" {
  type = string
}

// Email notification for high severity alerts should be enabled
variable "email_notification_for_high_severity_alerts_should_be_enabled_policy_effect" {
  type = string
}

// Network Watcher should be enabled
variable "network_watcher_should_be_enabled_policy_effect" {
  type = string
}

// Function apps should have 'Client Certificates (Incoming client certificates)' enabled
variable "function_apps_should_have_client_certificates_icc_enabled_policy_effect" {
  type = string
}

// Ensure WEB app has 'Client Certificates (Incoming client certificates)' set to 'On'
variable "ensure_web_app_has_client_certificates_icc_set_to_on_policy_effect" {
  type = string
}

// Kubernetes clusters should not use the default namespace
variable "kubernetes_clusters_should_not_use_the_default_namespace_policy_effect" {
  type = string
}

// Kubernetes cluster pod hostPath volumes should only use allowed host paths
variable "kubernetes_cluster_pod_hostpath_volumes_should_only_use_allowed_host_paths_policy_effect" {
  type = string
}

// Kubernetes cluster pods should only use approved host network and port range
variable "kubernetes_cluster_pods_should_only_use_approved_host_network_and_port_range_policy_effect" {
  type = string
}

// Kubernetes cluster pods should only use approved host network and port range
variable "function_app_should_only_be_accessible_over_https_policy_effect" {
  type = string
}

// Windows Defender Exploit Guard should be enabled on your machines
variable "windows_defender_exploit_guard_should_be_enabled_on_your_machines_policy_effect" {
  type = string
}

// Subscriptions should have a contact email address for security issues
variable "subscriptions_should_have_a_contact_email_address_for_security_issues_policy_effect" {
  type = string
}

// Linux machines should meet requirements for the Azure compute security baseline
variable "linux_machines_should_meet_requirements_for_the_azure_compute_security_baseline_policy_effect" {
  type = string
}

// Guest Configuration extension should be installed on your machines
variable "guest_configuration_extension_should_be_installed_on_your_machines_policy_effect" {
  type = string
}

// Guest Attestation extension should be installed on supported Linux virtual machines
variable "guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_policy_effect" {
  type = string
}

// Windows machines should meet requirements of the Azure compute security baseline
variable "windows_machines_should_meet_requirements_of_the_azure_compute_security_baseline_policy_effect" {
  type = string
}

// Guest Attestation extension should be installed on supported Linux virtual machines scale sets
variable "guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_scale_sets_policy_effect" {
  type = string
}

// Vulnerability assessment should be enabled on SQL Managed Instance
variable "vulnerability_assessment_should_be_enabled_on_sql_managed_instance_policy_effect" {
  type = string
}

// Vulnerability assessment should be enabled on your SQL servers
variable "vulnerability_assessment_should_be_enabled_on_your_sql_servers_policy_effect" {
  type = string
}

// A vulnerability assessment solution should be enabled on your virtual machines
variable "a_vulnerability_assessment_solution_should_be_enabled_on_your_virtual_machines_policy_effect" {
  type = string
}

// SQL servers on machines should have vulnerability findings resolved
variable "sql_servers_on_machines_should_have_vulnerability_findings_resolved_policy_effect" {
  type = string
}

// Ensure that 'Java version' is the latest, if used as a part of the Function app
variable "ensure_that_java_version_is_the_latest_if_used_as_a_part_of_the_function_app_policy_effect" {
  type = string
}

// Ensure that 'Python version' is the latest, if used as a part of the Web app
variable "ensure_that_python_version_is_the_latest_if_used_as_a_part_of_the_web_app_policy_effect" {
  type = string
}

// Container registry images should have vulnerability findings resolved
variable "container_registry_images_should_have_vulnerability_findings_resolved_policy_effect" {
  type = string
}

// Ensure that 'Python version' is the latest, if used as a part of the API app
variable "ensure_that_python_version_is_the_latest_if_used_as_a_part_of_the_api_app_policy_effect" {
  type = string
}

// Azure Defender for servers should be enabled
variable "azure_defender_for_servers_should_be_enabled_policy_effect" {
  type = string
}

// Endpoint protection solution should be installed on virtual machine scale sets
variable "endpoint_protection_solution_should_be_installed_on_virtual_machine_scale_sets_policy_effect" {
  type = string
}

// Endpoint protection should be installed on your machines
variable "endpoint_protection_should_be_installed_on_your_machines_policy_effect" {
  type = string
}

// Endpoint protection health issues should be resolved on your machines
variable "endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy_effect" {
  type = string
}

// Azure Backup should be enabled for Virtual Machines
variable "azure_backup_should_be_enabled_for_virtual_machines_policy_effect" {
  type = string
}

// Geo-redundant backup should be enabled for Azure Database for PostgreSQL
variable "geo_redundant_backup_should_be_enabled_for_azure_database_for_postgresql_policy_effect" {
  type = string
}

// Geo-redundant backup should be enabled for Azure Database for MySQL
variable "geo_redundant_backup_should_be_enabled_for_azure_database_for_mysql_policy_effect" {
  type = string
}

// Geo-redundant backup should be enabled for Azure Database for MariaDB
variable "geo_redundant_backup_should_be_enabled_for_azure_database_for_mariadb_policy_effect" {
  type = string
}

// Vulnerabilities in container security configurations should be remediated
variable "vulnerabilities_in_container_security_configurations_should_be_remediated_policy_effect" {
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