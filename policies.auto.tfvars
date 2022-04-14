/*
  -----------
  Org Prefix
  -----------
*/

org_prefix = "<Your Value Here>"

/*
  -----------------
  scope of policy
  -----------------
*/

initiative_management_scope = "<Your Value Here>"
policy_management_scope     = "<Your Value Here>"

/*
  -------------------------
  policy names and details
  -------------------------
*/

// Allowed Regions Policy Details
allowed_regions_policy_name         = "Allowed Azure Regions"
allowed_regions_policy_display_name = "Allowed Azure Regions"
allowed_regions_policy_description  = "This policy allows or audit resources to be created in the specific locations."
allowed_regions_policy_category     = "General"
allowed_regions_policy_effect       = "audit"

// Allowed Resource Type Details
allowed_resource_type_policy_name         = "Allowed Azure Resource Type"
allowed_resource_type_policy_display_name = "Allowed Azure Resource Type"
allowed_resource_type_policy_description  = "This policy enables you to specify the resource types that organization can deploy."
allowed_resource_type_policy_category     = "General"
allowed_resource_type_policy_effect       = "audit"

// Allowed SQL version
allowed_sql_version_policy_name         = "Allowed SQL Database version"
allowed_sql_version_policy_display_name = "Allowed SQL Database version"
allowed_sql_version_policy_description  = "This policy ensures all SQL servers use allowed version only"
allowed_sql_version_policy_category     = "SQL"
allowed_sql_version_policy_effect       = "audit"

// Allowed Storage Account SKU Details
allowed_storage_account_sku_policy_name         = "Allowed Storage Account SKU"
allowed_storage_account_sku_policy_display_name = "Allowed Storage Account SKU"
allowed_storage_account_sku_policy_description  = "This policy enables a set of storage account SKUs that can be deployed"
allowed_storage_account_sku_policy_category     = "Storage"
allowed_storage_account_SKUs_policy_effect      = "audit"

// Allowed VM Extensions Details
allowed_vm_extensions_policy_name         = "Allowed VM Extensions"
allowed_vm_extensions_policy_display_name = "Allowed VM Extensions"
allowed_vm_extensions_policy_description  = "The list of approved extension types that can be installed."
allowed_vm_extensions_policy_category     = "Compute"
allowed_vm_extensions_policy_effect       = "audit"

// Allowed VM OS version
allowed_vm_os_version_policy_name         = "Allowed VM OS Versions"
allowed_vm_os_version_policy_display_name = "Allowed VM OS Versions"
allowed_vm_os_version_policy_description  = "Reports VMs as non-compliant if the VM Image (OS) is not in the list of allowed OS image."
allowed_vm_os_version_policy_category     = "Compute"
allowed_vms_os_version_policy_effect      = "audit"

// Allowed VM SKU Details
allowed_vm_sku_policy_name         = "Allowed VM SKU"
allowed_vm_sku_policy_display_name = "Allowed VM SKU"
allowed_vm_sku_policy_description  = "This policy allows to create certain types of VMs SKU only."
allowed_vm_sku_policy_category     = "Compute"
allowed_vm_sku_policy_effect       = "audit"

// Key Vault Soft Delete Details
keys_vault_soft_delete_policy_name         = "Key Vault Should have Soft Delete Enabled"
keys_vault_soft_delete_policy_display_name = "Key Vault Should have Soft Delete Enabled"
keys_vault_soft_delete_policy_description  = "Deleting a key vault without soft delete enabled permanently deletes all secrets, keys, and certificates stored in the key vault. Accidental deletion of a key vault can lead to permanent data loss. Soft delete allows you to recover an accidentally deleted key vault for a configurable retention period."
keys_vault_soft_delete_policy_category     = "Keys"
keys_vault_soft_delete_policy_effect       = "Audit"

// Key Vault Purge Protection Details
keys_vault_purge_protection_policy_name         = "Key Vault Should have Purge Protection Enabled"
keys_vault_purge_protection_policy_display_name = "Key Vault Should have Purge Protection Enabled"
keys_vault_purge_protection_policy_description  = "Malicious deletion of a key vault can lead to permanent data loss. A malicious insider in your organization can potentially delete and purge key vaults. Purge protection protects you from insider attacks by enforcing a mandatory retention period for soft deleted key vaults. No one inside your organization or Microsoft will be able to purge your key vaults during the soft delete retention period."
keys_vault_purge_protection_policy_category     = "Keys"
keys_vault_purge_protection_policy_effect       = "Audit"

// Enable Network Watch Details
network_watcher_enable_policy_name         = "Enable Network Watcher"
network_watcher_enable_policy_display_name = "Enable Network Watcher"
network_watcher_enable_policy_description  = "This policy creates a network watcher resource in regions with virtual networks."
network_watcher_enable_policy_category     = "Network"
network_watcher_enable_policy_effect       = "auditifnotexists"

// NSG for every Subnet Details
nsg_every_subnet_policy_name         = "Enable NSG every Subnet"
nsg_every_subnet_policy_display_name = "Enable NSG every Subnet"
nsg_every_subnet_policy_description  = "Every subnet should have a NSG attached"
nsg_every_subnet_policy_category     = "Network"
nsg_every_subnet_policy_effect       = "auditifnotexists"

// NSG Inbound Rules Details
nsg_inbound_rules_policy_name         = "NSG for Inbound Rules"
nsg_inbound_rules_policy_display_name = "NSG for Inbound Rules"
nsg_inbound_rules_policy_description  = "Network security group rules that allow all inbound traffic."
nsg_inbound_rules_policy_category     = "Network"
nsg_inbound_rules_policy_effect       = "auditifnotexists"

// SQL Database Private Endpoint Details
sql_database_private_endpoint_policy_name         = "SQL Database Private Endpoint"
sql_database_private_endpoint_policy_display_name = "SQL Database Private Endpoint"
sql_database_private_endpoint_policy_description  = "This policy audits for SQL Database Private Endpoint"
sql_database_private_endpoint_policy_category     = "SQL"
sql_database_private_endpoint_policy_effect       = "audit"

// SQL Database TLS version Details
sql_database_tls_version_policy_name         = "SQL Database TLS version"
sql_database_tls_version_policy_display_name = "SQL Database TLS version"
sql_database_tls_version_policy_description  = "This policy audits for SQL Database TLS version"
sql_database_tls_version_policy_category     = "SQL"
sql_database_tls_version_policy_effect       = "audit"

// SQL Server Network Access Details
sql_server_network_access_policy_name         = "SQL Server Public Network Access"
sql_server_network_access_policy_display_name = "SQL Server Public Network Access"
sql_server_network_access_policy_description  = "This policy audits for sql server network access"
sql_server_network_access_policy_category     = "SQL"
sql_server_network_access_policy_effect       = "audit"

// SSL Storage Secure Transfer Details
ssl_storage_secure_transfer_setting_policy_name         = "SSL Storage Transfer Settings"
ssl_storage_secure_transfer_setting_policy_display_name = "SSL Storage Transfer Settings"
ssl_storage_secure_transfer_setting_policy_description  = "This policy audits Storage account for secure file transfers"
ssl_storage_secure_transfer_setting_policy_category     = "Storage"
ssl_storage_secure_transfer_setting_policy_effect       = "audit"

// Storage Account Key Expiry Details
storage_account_key_expiry_policy_name         = "Storage Account Key Expiry Status"
storage_account_key_expiry_policy_display_name = "Storage Account Key Expiry Status"
storage_account_key_expiry_policy_description  = "This policy audits for storage account expired keys"
storage_account_key_expiry_policy_category     = "Storage"
storage_account_key_expiry_policy_effect       = "audit"

// Storage Account Network Access Details
storage_account_network_access_policy_name         = "Storage Account Public Network Access"
storage_account_network_access_policy_display_name = "Storage Account Public Network Access"
storage_account_network_access_policy_description  = "This policy audits for storage account network access"
storage_account_network_access_policy_category     = "Storage"
storage_account_network_access_policy_effect       = "audit"

// Mandatory Tags Details
tags_mandatory_policy_name         = "Mandatory Tags"
tags_mandatory_policy_display_name = "Mandatory Tags"
tags_mandatory_policy_description  = "This policy deny Resources without Mandatory Tags"
tags_mandatory_policy_category     = "General"
tags_mandatory_policy_effect       = "deny"

// Optional Tags Details
tags_optional_policy_name         = "Optional Tags"
tags_optional_policy_display_name = "Optional Tags"
tags_optional_policy_description  = "All resources in which optional Tags doesn't exisits"
tags_optional_policy_category     = "General"
tags_optional_policy_effect       = "audit"

// VM Encryption Details
vm_encryption_policy_name         = "VM Encryption"
vm_encryption_policy_display_name = "VM Encryption"
vm_encryption_policy_description  = "This policy audits for Virtual Machine Encryption"
vm_encryption_policy_category     = "Compute"
vm_encryption_policy_effect       = "audit"

// Internet Facig NSG enabled Details
vm_internet_facing_nsg_policy_name         = "Internet facing VM NSG"
vm_internet_facing_nsg_policy_display_name = "Internet facing VM NSG"
vm_internet_facing_nsg_policy_description  = "Internet facing Virtual Machine should have NSG attached"
vm_internet_facing_nsg_policy_category     = "Compute"
vm_internet_facing_nsg_policy_effect       = "auditifnotexists"

// VM IP forwarding Details
vm_ip_forwarding_policy_name         = "VM IP forwarding"
vm_ip_forwarding_policy_display_name = "VM IP forwarding"
vm_ip_forwarding_policy_description  = "VM IP Forwarding should be disabled"
vm_ip_forwarding_policy_category     = "Compute"
vm_ip_forwarding_policy_effect       = "auditifnotexists"

// VM Managed Disk Details
vm_managed_disk_policy_name         = "VM Managed Disk"
vm_managed_disk_policy_display_name = "VM Managed Disk"
vm_managed_disk_policy_description  = "This policy audits for Virtual Machine Managed Disk"
vm_managed_disk_policy_category     = "Compute"
vm_managed_disk_policy_effect       = "audit"

// VM Management Port Details
vm_management_port_policy_name         = "VM Management Port"
vm_management_port_policy_display_name = "VM Management Port"
vm_management_port_policy_description  = "This policy audits for Virtual Machine Management Port"
vm_management_port_policy_category     = "Compute"
vm_management_port_policy_effect       = "auditifnotexists"

// WAF for Application Gateway Details
waf_application_gateway_policy_name         = "WAF for Application Gateway"
waf_application_gateway_policy_display_name = "WAF for Application Gateway"
waf_application_gateway_policy_description  = "WAF for Application Gateway should be enabled"
waf_application_gateway_policy_category     = "Network"
waf_application_gateway_policy_effect       = "audit"

// Key Vault Key Expiry Status Details
key_vault_key_expiry_status_policy_effect = "Audit"

// Adaptive network hardening recommendations should be applied on internet facing virtual machines
adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy_effect = "AuditIfNotExists"

// Private endpoint should be configured for Key Vault
private_endpoint_should_be_configured_for_key_vault_policy_effect = "Audit"

// Management ports should be closed on your virtual machines
management_ports_should_be_closed_on_your_virtual_machines_policy_effect = "AuditIfNotExists"

// Management ports of virtual machines should be protected with just-in-time network access control
management_ports_of_virtual_machines_should_be_protected_with_just_in_time_network_access_control_policy_effect = "AuditIfNotExists"

// All Internet traffic should be routed via your deployed Azure Firewall
all_internet_traffic_should_be_routed_via_your_deployed_azure_firewall_policy_effect = "AuditIfNotExists"

// IP Forwarding on your virtual machine should be disabled
ip_forwarding_on_your_virtual_machine_should_be_disabled_policy_effect = "AuditIfNotExists"

// Azure DDoS Protection Standard should be enabled
azure_ddos_protection_standard_should_be_enabled_policy_effect = "AuditIfNotExists"

// Web Application Firewall (WAF) should be enabled for Application Gateway
web_application_firewall_should_be_enabled_for_application_gateway_policy_effect = "Audit"

// Azure Web Application Firewall should be enabled for Azure Front Door entry-points
web_application_firewall_should_be_enabled_for_azure_front_door_entry_points_policy_effect = "Audit"

// Latest TLS version should be used in your Web App
latest_tls_version_should_be_used_in_your_web_app_policy_effect = "AuditIfNotExists"

// Latest TLS version should be used in your API App
latest_tls_version_should_be_used_in_your_api_app_policy_effect = "AuditIfNotExists"

// Latest TLS version should be used in your Function App
latest_tls_version_should_be_used_in_your_function_app_policy_effect = "AuditIfNotExists"

// Azure Defender for DNS should be enabled
azure_defender_for_dns_should_be_enabled_policy_effect = "AuditIfNotExists"

// An Azure Active Directory administrator should be provisioned for SQL servers
an_azure_active_directory_administrator_should_be_provisioned_for_sql_servers_policy_effect = "AuditIfNotExists"

// Service Fabric clusters should only use Azure Active Directory for client authentication
service_fabric_clusters_should_only_use_azure_active_directory_for_client_authentication_policy_effect = "Audit"

// Managed identity should be used in your Web App
managed_identity_should_be_used_in_your_web_app_policy_effect = "AuditIfNotExists"

// Managed identity should be used in your Function App
managed_identity_should_be_used_in_your_function_app_policy_effect = "AuditIfNotExists"

// Managed identity should be used in your API App
managed_identity_should_be_used_in_your_api_app_policy_effect = "AuditIfNotExists"

// Virtual machines' Guest Configuration extension should be deployed with system-assigned managed identity
virtual_machines_guest_configuration_extension_should_be_deployed_with_system_assigned_managed_identity_policy_effect = "AuditIfNotExists"

// Authentication to Linux machines should require SSH keys
authentication_to_linux_machines_should_require_ssh_keys_policy_effect = "AuditIfNotExists"

// MFA should be enabled on accounts with read permissions on your subscription
mfa_should_be_enabled_on_accounts_with_read_permissions_on_your_subscription_policy_effect = "AuditIfNotExists"

// MFA should be enabled accounts with write permissions on your subscription
mfa_should_be_enabled_accounts_with_write_permissions_on_your_subscription_policy_effect = "AuditIfNotExists"

// MFA should be enabled on accounts with owner permissions on your subscription
mfa_should_be_enabled_on_accounts_with_write_owner_permissions_on_your_subscription_policy_effect = "AuditIfNotExists"

// A maximum of 3 owners should be designated for your subscription
a_maximum_of_3_owners_should_be_designated_for_your_subscription_policy_effect = "AuditIfNotExists"

// External accounts with owner permissions should be removed from your subscription
external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy_effect = "AuditIfNotExists"

// There should be more than one owner assigned to your subscription
there_should_be_more_than_one_owner_assigned_to_your_subscription_policy_effect = "AuditIfNotExists"

// Deprecated accounts with owner permissions should be removed from your subscription
deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy_effect = "AuditIfNotExists"

// External accounts with read permissions should be removed from your subscription
external_accounts_with_read_permissions_should_be_removed_from_your_subscription_policy_effect = "AuditIfNotExists"

// Deprecated accounts should be removed from your subscription
deprecated_accounts_should_be_removed_from_your_subscription_policy_effect = "AuditIfNotExists"

// External accounts with write permissions should be removed from your subscription
external_accounts_with_write_permissions_should_be_removed_from_your_subscription_policy_effect = "AuditIfNotExists"

// Role-Based Access Control (RBAC) should be used on Kubernetes Services
role_Based_access_control_should_be_used_on_kubernetes_services_policy_effect = "Audit"

// Audit usage of custom RBAC rules
audit_usage_of_custom_rbac_rules_policy_effect = "Audit"

// Azure Defender for SQL should be enabled for unprotected SQL Managed Instances
azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy_effect = "AuditIfNotExists"

// Azure Defender for open-source relational databases should be enabled
azure_defender_for_open_source_relational_databases_should_be_enabled_policy_effect = "AuditIfNotExists"

// Azure Defender for SQL servers on machines should be enabled
azure_defender_for_sql_servers_on_machines_should_be_enabled_policy_effect = "AuditIfNotExists"

// Azure Defender for Azure SQL Database servers should be enabled
azure_defender_for_azure_sql_database_servers_should_be_enabled_policy_effect = "AuditIfNotExists"

// Azure Defender for Storage should be enabled
azure_defender_for_storage_should_be_enabled_policy_effect = "AuditIfNotExists"

// Secure transfer to storage accounts should be enabled
secure_transfer_to_storage_accounts_should_be_enabled_policy_effect = "Audit"

// FTPS only should be required in your Function App
ftps_only_should_be_required_in_your_function_app_policy_effect = "AuditIfNotExists"

// FTPS should be required in your Web App
ftps_should_be_required_in_your_web_app_policy_effect = "AuditIfNotExists"

// Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources
virtual_machines_should_encrypt_temp_disks_caches_and_data_flows_between_compute_and_storage_resources_policy_effect = "AuditIfNotExists"

// Automation account variables should be encrypted
automation_account_variables_should_be_encrypted_policy_effect = "Audit"

// Service Fabric clusters should have the ClusterProtectionLevel property set to EncryptAndSign
service_fabric_clusters_should_have_the_cluster_protection_level_property_set_to_encrypt_and_sign_policy_effect = "Audit"

// Transparent Data Encryption on SQL databases should be enabled
transparent_data_encryption_on_sql_databases_should_be_enabled_policy_effect = "AuditIfNotExists"

// Key Vault keys should have an expiration date
key_vault_keys_should_have_an_expiration_date_policy_effect = "Audit"

// Key Vault secrets should have an expiration date
key_vault_secrets_should_have_an_expiration_date_policy_effect = "Audit"

// Certificates should have the specified maximum validity period
certificates_should_have_the_specified_maximum_validity_period_policy_effect = "Audit"

// Resource logs in Key Vault should be enabled
resource_logs_in_key_vault_should_be_enabled_policy_effect = "AuditIfNotExists"

// Azure Key Vault should disable public network access
azure_key_vault_should_disable_public_network_access_policy_effect = "Audit"

// Key vaults should have purge protection enabled
key_vaults_should_have_purge_protection_enabled_policy_effect = "Audit"

// Azure Defender for Key Vault should be enabled
azure_defender_for_key_vault_should_be_enabled_policy_effect = "AuditIfNotExists"

// Storage accounts should be migrated to new Azure Resource Manager resources
storage_accounts_should_be_migrated_to_new_azure_resource_ranager_resources_policy_effect = "Audit"

// Virtual machines should be migrated to new Azure Resource Manager resources
virtual_machines_should_be_migrated_to_new_azure_resource_ranager_resources_policy_effect = "Audit"

// Azure Defender for Resource Manager should be enabled
azure_defender_for_resource_manager_should_be_enabled_policy_effect = "AuditIfNotExists"

// Resource logs in Logic Apps should be enabled
resource_logs_in_logic_apps_should_be_enabled_policy_effect = "AuditIfNotExists"

// Resource logs in Logic Apps should be enabled
resource_logs_in_app_services_should_be_enabled_policy_effect = "AuditIfNotExists"

// Resource logs in Service Bus should be enabled
resource_logs_in_service_bus_should_be_enabled_policy_effect = "AuditIfNotExists"

// Resource logs in Azure Stream Analytics should be enabled
resource_logs_in_azure_stream_analytics_should_be_enabled_policy_effect = "AuditIfNotExists"

// Log Analytics agent should be installed on your virtual machine for Azure Security Center monitoring
log_analytics_agent_should_be_installed_on_your_virtual_machine_for_azure_security_center_monitoring_policy_effect = "AuditIfNotExists"

// Auto provisioning of the Log Analytics agent should be enabled on your subscription
auto_provisioning_of_the_log_analytics_agent_should_be_enabled_on_your_subscription_policy_effect = "AuditIfNotExists"

// Linux machines should have Log Analytics agent installed on Azure Arc
linux_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy_effect = "AuditIfNotExists"

// Log Analytics agent should be installed on your virtual machine scale sets for Azure Security Center monitoring
log_analytics_agent_should_be_installed_on_your_virtual_machine_scale_sets_for_azure_security_center_monitoring_policy_effect = "AuditIfNotExists"

// Windows machines should have Log Analytics agent installed on Azure Arc
windows_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy_effect = "AuditIfNotExists"

// SQL servers with auditing to storage account destination should be configured with 90 days retention or higher
sql_servers_with_auditing_to_storage_account_destination_should_be_configured_with_90_days_retention_or_higher_policy_effect = "AuditIfNotExists"

// Email notification to subscription owner for high severity alerts should be enabled
email_notification_to_subscription_owner_for_high_severity_alerts_should_be_enabled_policy_effect = "AuditIfNotExists"

// Email notification for high severity alerts should be enabled
email_notification_for_high_severity_alerts_should_be_enabled_policy_effect = "AuditIfNotExists"

// Network Watcher should be enabled
network_watcher_should_be_enabled_policy_effect = "AuditIfNotExists"

// Function apps should have 'Client Certificates (Incoming client certificates)' enabled
function_apps_should_have_client_certificates_icc_enabled_policy_effect = "Audit"

// Ensure WEB app has 'Client Certificates (Incoming client certificates)' set to 'On'
ensure_web_app_has_client_certificates_icc_set_to_on_policy_effect = "Audit"

// Kubernetes clusters should not use the default namespace
kubernetes_clusters_should_not_use_the_default_namespace_policy_effect = "Audit"

// Kubernetes cluster pod hostPath volumes should only use allowed host paths
kubernetes_cluster_pod_hostpath_volumes_should_only_use_allowed_host_paths_policy_effect = "Audit"

// Kubernetes cluster pods should only use approved host network and port range
kubernetes_cluster_pods_should_only_use_approved_host_network_and_port_range_policy_effect = "Audit"

// Function App should only be accessible over HTTPS
function_app_should_only_be_accessible_over_https_policy_effect = "Audit"

// Windows Defender Exploit Guard should be enabled on your machines
windows_defender_exploit_guard_should_be_enabled_on_your_machines_policy_effect = "AuditIfNotExists"

// Subscriptions should have a contact email address for security issues
subscriptions_should_have_a_contact_email_address_for_security_issues_policy_effect = "AuditIfNotExists"

// Linux machines should meet requirements for the Azure compute security baseline
linux_machines_should_meet_requirements_for_the_azure_compute_security_baseline_policy_effect = "AuditIfNotExists"

// Guest Configuration extension should be installed on your machines
guest_configuration_extension_should_be_installed_on_your_machines_policy_effect = "AuditIfNotExists"

// Guest Attestation extension should be installed on supported Linux virtual machines
guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_policy_effect = "AuditIfNotExists"

// Windows machines should meet requirements of the Azure compute security baseline
windows_machines_should_meet_requirements_of_the_azure_compute_security_baseline_policy_effect = "AuditIfNotExists"

// Guest Attestation extension should be installed on supported Linux virtual machines scale sets
guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_scale_sets_policy_effect = "AuditIfNotExists"

// Vulnerability assessment should be enabled on SQL Managed Instance
vulnerability_assessment_should_be_enabled_on_sql_managed_instance_policy_effect = "AuditIfNotExists"

// Vulnerability assessment should be enabled on your SQL servers
vulnerability_assessment_should_be_enabled_on_your_sql_servers_policy_effect = "AuditIfNotExists"

// A vulnerability assessment solution should be enabled on your virtual machines
a_vulnerability_assessment_solution_should_be_enabled_on_your_virtual_machines_policy_effect = "AuditIfNotExists"

// SQL servers on machines should have vulnerability findings resolved
sql_servers_on_machines_should_have_vulnerability_findings_resolved_policy_effect = "AuditIfNotExists"

// Ensure that 'Java version' is the latest, if used as a part of the Function app
ensure_that_java_version_is_the_latest_if_used_as_a_part_of_the_function_app_policy_effect = "AuditIfNotExists"

// Ensure that 'Python version' is the latest, if used as a part of the Web app
ensure_that_python_version_is_the_latest_if_used_as_a_part_of_the_web_app_policy_effect = "AuditIfNotExists"

// Container registry images should have vulnerability findings resolved
container_registry_images_should_have_vulnerability_findings_resolved_policy_effect = "AuditIfNotExists"

// Ensure that 'Python version' is the latest, if used as a part of the API app
ensure_that_python_version_is_the_latest_if_used_as_a_part_of_the_api_app_policy_effect = "AuditIfNotExists"

// Azure Defender for servers should be enabled
azure_defender_for_servers_should_be_enabled_policy_effect = "AuditIfNotExists"

// Endpoint protection solution should be installed on virtual machine scale sets
endpoint_protection_solution_should_be_installed_on_virtual_machine_scale_sets_policy_effect = "AuditIfNotExists"

// Endpoint protection should be installed on your machines
endpoint_protection_should_be_installed_on_your_machines_policy_effect = "AuditIfNotExists"

// Endpoint protection health issues should be resolved on your machines
endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy_effect = "AuditIfNotExists"

// Azure Backup should be enabled for Virtual Machines
azure_backup_should_be_enabled_for_virtual_machines_policy_effect = "AuditIfNotExists"

// Geo-redundant backup should be enabled for Azure Database for PostgreSQL
geo_redundant_backup_should_be_enabled_for_azure_database_for_postgresql_policy_effect = "Audit"

// Geo-redundant backup should be enabled for Azure Database for MySQL
geo_redundant_backup_should_be_enabled_for_azure_database_for_mysql_policy_effect = "Audit"

// Geo-redundant backup should be enabled for Azure Database for MariaDB
geo_redundant_backup_should_be_enabled_for_azure_database_for_mariadb_policy_effect = "Audit"

// Vulnerabilities in container security configurations should be remediated
vulnerabilities_in_container_security_configurations_should_be_remediated_policy_effect = "AuditIfNotExists"

/*
  ---------------
  allowed regions
  ---------------
*/

allowed_regions = [
  "canadacentral",
  "canadaeast"
]

/*
  ---------------------
  allowed resource type
  ---------------------
*/

allowed_resource_type = [
  "microsoft.synapse/workspaces/bigdatapools",
  "microsoft.network/applicationgateways",
  "microsoft.network/applicationgatewaywebapplicationfirewallpolicies",
  "microsoft.insights/components",
  "microsoft.network/applicationsecuritygroups",
  "microsoft.databricks/workspaces",
  "microsoft.containerinstance/containergroups",
  "microsoft.datadog/monitors",
  "microsoft.compute/disks",
  "microsoft.eventhub/namespaces",
  "microsoft.keyvault/vaults",
  "microsoft.network/loadbalancers",
  "microsoft.operationalinsights/querypacks",
  "microsoft.operationalinsights/workspaces",
  "microsoft.machinelearningservices/workspaces",
  "microsoft.managedidentity/userassignedidentities",
  "microsoft.network/natgateways",
  "microsoft.network/networkinterfaces",
  "microsoft.network/networksecuritygroups",
  "microsoft.network/networkwatchers",
  "microsoft.network/networkwatchers/flowlogs",
  "microsoft.network/privatednszones",
  "microsoft.network/privateendpoints",
  "microsoft.network/publicipaddresses",
  "microsoft.operationsmanagement/solutions",
  "microsoft.sql/servers/databases",
  "microsoft.sql/servers",
  "microsoft.storage/storageaccounts",
  "microsoft.synapse/privatelinkhubs",
  "microsoft.synapse/workspaces",
  "microsoft.compute/virtualmachines",
  "microsoft.compute/virtualmachinescalesets",
  "microsoft.network/virtualnetworks",
  "microsoft.network/networkprofiles",
  "microsoft.network/privatednszones/virtualnetworklinks",
  "microsoft.network/networkintentpolicies",
  "microsoft.compute/virtualmachines/extensions",
  "microsoft.insights/actiongroups",
  "microsoft.insights/activitylogalerts",
  "microsoft.insights/autoscalesettings",
  "microsoft.alertsmanagement/smartdetectoralertrules",
  "microsoft.automation/automationaccounts",
  "microsoft.automation/automationaccounts/runbooks"
]

/*
  --------------
  allowed vm sku
  --------------
*/

allowed_vms_sku = [
  "Standard_F4",
  "Standard_B2ms",
  "Standard_B4ms",
  "Standard_D2_v3"
]

/*
  ---------------------
  allowed vm extensions
  ---------------------
*/

allowed_vm_extensions = [
  "NetworkWatcherAgentWindows",
  "MicrosoftMonitoringAgent",
  "CustomScriptExtension"
]

/*
  ---------------------
  allowed vm os version
  ---------------------
*/

allowed_windows_os_version = [
  "2019-Datacenter",
  "2016-Datacenter"
]

allowed_linux_os_version = [
  "7.4",
  "7-LVM"
]

/*
  -----------------------------
  allowed storage account SKUs
  -----------------------------
*/

allowed_storage_account_SKUs = [
  "Standard_LRS",
  "Standard_RAGRS",
  "Standard_GRS"
]

/*
  -----------------------
  SQL Server TLS version
  -----------------------
*/

sql_database_allowed_tls_version = "1.2"

/*
  --------------------------
  Allowed SQL Server Version
  --------------------------
*/

allowed_sql_version = "12.0"

/*
  -----------------------
  Network Watcher RG Name
  -----------------------
*/

network_watcher_resource_group_name = "NetworkWatcherRG"