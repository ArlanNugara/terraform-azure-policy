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