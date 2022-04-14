resource "azurerm_policy_set_definition" "policy-set-definition" {
  name                = "${var.org_prefix}Baseline Azure Policy Set Definition"
  policy_type         = "Custom"
  display_name        = "${var.org_prefix}Baseline Azure Policy Set Definition"
  management_group_id = var.policy_management_scope
  /*
  Policy Definition Reference for Allowed Region
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-Allowed Azure Regions
  Policy Category  : General
  */
  policy_definition_reference {
    policy_definition_id = module.allowed_regions_policy.policy_id
  }
  /*
  Policy Definition Reference for Allowed Storage SKUs
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-Allowed storage account SKUs
  Policy Category  : Storage
  */
  policy_definition_reference {
    policy_definition_id = module.allowed_storage_account_SKUs_policy.policy_id
  }
  /*
  Policy Definition Reference for Allowed Resource Type
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-Allowed Azure Resource Type
  Policy Category  : General
  */
  policy_definition_reference {
    policy_definition_id = module.allowed_resource_type_policy.policy_id
  }
  /*
  Policy Definition Reference for Allowed VM SKUs
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-Allowed VMs SKU type
  Policy Category  : Compute
  */
  policy_definition_reference {
    policy_definition_id = module.allowed_vms_sku_policy.policy_id
  }
  /*
  Policy Definition Reference for Allowed VM OS Version
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-Allowed VMs OS versions
  Policy Category  : Compute
  */
  policy_definition_reference {
    policy_definition_id = module.allowed_vms_os_version_policy.policy_id
  }
  /*
  Policy Definition Reference for Allowed VM Extensions
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-Allowed VM extension types
  Policy Category  : Compute
  */
  policy_definition_reference {
    policy_definition_id = module.allowed_vm_extensions_policy.policy_id
  }
  /*
  Policy Definition Reference for Optional Tags
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-Optional Tags
  Policy Category  : General
  */
  policy_definition_reference {
    policy_definition_id = module.tags_optional_policy.policy_id
    parameter_values = jsonencode(
      {
        "App" : {
          "type" : "String",
          "value" : "App",
          "metadata" : {
            "displayName" : "App Tag"
          }
        },
        "Cost Center" : {
          "type" : "String",
          "value" : "Cost Center",
          "metadata" : {
            "displayName" : "Cost Center Tag"
          }
        },
        "Department" : {
          "type" : "String",
          "value" : "Department",
          "metadata" : {
            "displayName" : "Department Tag"
          }
        },
        "Owner" : {
          "type" : "String",
          "value" : "Owner",
          "metadata" : {
            "displayName" : "Owner Tag"
          }
        },
        "Policy" : {
          "type" : "String",
          "value" : "Policy",
          "metadata" : {
            "displayName" : "Policy Tag"
          }
        },
        "Product" : {
          "type" : "String",
          "value" : "Product",
          "metadata" : {
            "displayName" : "Product Tag"
          }
        },
        "Salesforce CST ID" : {
          "type" : "String",
          "value" : "Salesforce CST ID Tag",
          "metadata" : {
            "displayName" : "Salesforce CST ID Tag"
          }
        },
        "SLA Severity" : {
          "type" : "String",
          "value" : "SLA Severity Tag",
          "metadata" : {
            "displayName" : "SLA Severity Tag"
          }
        },
        "Stakeholders" : {
          "type" : "String",
          "value" : "Stakeholder",
          "metadata" : {
            "displayName" : "Stakeholders Tag"
          }
        },
        "Tiers" : {
          "type" : "String",
          "value" : "Tiers",
          "metadata" : {
            "displayName" : "Tiers Tag"
          }
        }
      }
    )
  }
  /* 
  Policy Definition Reference for Allowed SQL Version
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-Allowed SQL Server version
  Policy Category  : SQL
  */
  policy_definition_reference {
    policy_definition_id = module.allowed_sql_version_policy.policy_id
  }
  /*
  Policy Definition Reference for NSG Subnet
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-NSG at every subnet
  Policy Category  : Network
  */
  policy_definition_reference {
    policy_definition_id = module.nsg_every_subnet_policy.policy_id
  }
  /*
  Policy Definition Reference for Network Workers
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-Network watcher enable when virtual networks are created
  Policy Category  : Network
  */
  policy_definition_reference {
    policy_definition_id = module.network_watcher_enable_policy.policy_id
  }
  /*
  Policy Definition Reference for SSL Storage Transfer
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-HTTPS setting on storage account
  Policy Category  : Storage
  */
  policy_definition_reference {
    policy_definition_id = module.ssl_storage_secure_transfer_setting_policy.policy_id
  }
  /*
  Policy Definition Reference for NSG Inbound Rules
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-NSG rule that allow all inbound traffic
  Policy Category  : Network
  */
  policy_definition_reference {
    policy_definition_id = module.nsg_inbound_rules_policy.policy_id
  }
  /*
  Policy Definition Reference for Storage Account Key Expiry. 
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-Storage Account Key Expiry
  Policy Category  : Storage
  */
  policy_definition_reference {
    policy_definition_id = module.storage_account_key_expiry_policy.policy_id
  }
  /*
  Policy Definition Reference for Storage Account Network Access
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-Storage Account Network Access
  Policy Category  : Storage
    */
  policy_definition_reference {
    policy_definition_id = module.storage_account_network_access_policy.policy_id
  }
  /*
  Policy Definition Reference for SQL Server Private Endpoint
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-SQL Database Private Endpoint
  Policy Category  : SQL
  */
  policy_definition_reference {
    policy_definition_id = module.sql_database_private_endpoint_policy.policy_id
  }
  /*
  Policy Definition Reference for SQL Server TLS Version
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-SQL Database TLS version
  Policy Category  : SQL
  */
  policy_definition_reference {
    policy_definition_id = module.sql_database_tls_version_policy.policy_id
  }
  /*
  Policy Definition Reference for SQL Server Network Access
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-SQL Server Network Access
  Policy Category  : SQL
  */
  policy_definition_reference {
    policy_definition_id = module.sql_server_network_access_policy.policy_id
  }
  /*
  Policy Definition Reference for Mandatory Tags
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-Mandatory Tags
  Policy Category  : General
  */
  policy_definition_reference {
    policy_definition_id = module.tags_mandatory_policy.policy_id
    parameter_values = jsonencode(
      {
        "Created By" : {
          "type" : "String",
          "value" : "Created By",
          "metadata" : {
            "displayName" : "Created By Tag"
          }
        },
        "Customer" : {
          "type" : "String",
          "value" : "Customer",
          "metadata" : {
            "displayName" : "Customer Tag"
          }
        },
        "Env" : {
          "type" : "String",
          "value" : "Env",
          "metadata" : {
            "displayName" : "Env Tag"
          }
        },
        "Region" : {
          "type" : "String",
          "value" : "Region",
          "metadata" : {
            "displayName" : "Region Tag"
          }
        }
      }
    )
  }
  /*
  Policy Definition Reference for Keys Vault Soft Delete Status
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-Keys Vault Soft Delete
  Policy Category  : Keys
  */
  policy_definition_reference {
    policy_definition_id = module.keys_vault_soft_delete_policy.policy_id
  }

  /*
  Policy Definition Reference for Keys Vault Purge Protection Status
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-Keys Vault Purge Protection
  Policy Category  : Keys
  */
  policy_definition_reference {
    policy_definition_id = module.keys_vault_purge_protection_policy.policy_id
  }

  /*
  Policy Definition Reference for Keys Vault Key Expiry Status In-Built Policy.
  -----------------------------------------------------------------------------
  Azure Policy Definition Name  : Key Vault keys should have an expiration date
  Azure Policy Definition Description  : Cryptographic keys should have a defined expiration date and not be permanent. Keys that are valid forever provide a potential attacker with more time to compromise the key. It is a recommended security practice to set expiration dates on cryptographic keys.
  Azure Policy Definition Category  : Key Vault
  Azure Policy Definition Definition ID  : /providers/Microsoft.Authorization/policyDefinitions/152b15f7-8e1f-4c1f-ab71-8c010ba5dbc0
  Azure Policy Definition Type  : Built-in
  Azure Policy Definition Mode  : Microsoft.KeyVault.Data
  */
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/152b15f7-8e1f-4c1f-ab71-8c010ba5dbc0"
    parameter_values = jsonencode(
      {
        "effect" : {
          "value" : "${var.key_vault_key_expiry_status_policy_effect}"
        }
      }
    )
  }
  /*
  Policy Definition Reference for VM Encryption
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-VM Encryption
  Policy Category  : Compute
  */
  policy_definition_reference {
    policy_definition_id = module.vm_encryption_policy.policy_id
  }
  /*
  Policy Definition Reference for VM Managed Disk
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-VM Managed Disk
  Policy Category  : Compute
  */
  policy_definition_reference {
    policy_definition_id = module.vm_managed_disk_policy.policy_id
  }
  /*
  Policy Definition Reference for VM Internet Facing NSG
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-VM Internet Facing NSG
  Policy Category  : Compute
  */
  policy_definition_reference {
    policy_definition_id = module.vm_internet_facing_nsg_policy.policy_id
  }
  /*
  Policy Definition Reference for VM Management Port
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-VM Management Port
  Policy Category  : Compute
  */
  policy_definition_reference {
    policy_definition_id = module.vm_management_port_policy.policy_id
  }
  /*
  Policy Definition Reference for VM IP forwarding
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-VM IP Forwarding
  Policy Category  : Networking
  */
  policy_definition_reference {
    policy_definition_id = module.vm_ip_forwarding_policy.policy_id
  }
  /*
  Policy Definition Reference for WAF for Application Gateway
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Inv-WAF for Application Gateway
  Policy Category  : Networking
  */
  policy_definition_reference {
    policy_definition_id = module.waf_application_gateway_policy.policy_id
  }
  /*
  Policy Definition Reference for Adaptive network hardening recommendations should be applied on internet facing virtual machines
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Adaptive network hardening recommendations should be applied on internet facing virtual machines
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy.policy_id
  }
  /*
  Policy Definition Reference for Private endpoint should be configured for Key Vault
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Private endpoint should be configured for Key Vault
  Policy Category  : Key Vault
  */
  policy_definition_reference {
    policy_definition_id = module.private_endpoint_should_be_configured_for_key_vault_policy.policy_id
  }
  /*
  Policy Definition Reference for Management ports should be closed on your virtual machines
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Management ports should be closed on your virtual machines
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.management_ports_should_be_closed_on_your_virtual_machines_policy.policy_id
  }
  /*
  Policy Definition Reference for Management ports of virtual machines should be protected with just-in-time network access control
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Management ports of virtual machines should be protected with just-in-time network access control
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.management_ports_of_virtual_machines_should_be_protected_with_just_in_time_network_access_control_policy.policy_id
  }
  /*
  Policy Definition Reference for All Internet traffic should be routed via your deployed Azure Firewall
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : All Internet traffic should be routed via your deployed Azure Firewall
  Policy Category  : Network
  */
  policy_definition_reference {
    policy_definition_id = module.all_internet_traffic_should_be_routed_via_your_deployed_azure_firewall_policy.policy_id
  }
  /*
  Policy Definition Reference for IP Forwarding on your virtual machine should be disabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : IP Forwarding on your virtual machine should be disabled
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.ip_forwarding_on_your_virtual_machine_should_be_disabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Azure DDoS Protection Standard should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Azure DDoS Protection Standard should be enabled
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.azure_ddos_protection_standard_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Web Application Firewall (WAF) should be enabled for Application Gateway
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Web Application Firewall (WAF) should be enabled for Application Gateway
  Policy Category  : Network
  */
  policy_definition_reference {
    policy_definition_id = module.web_application_firewall_should_be_enabled_for_application_gateway_policy.policy_id
  }
  /*
  Policy Definition Reference for Azure Web Application Firewall should be enabled for Azure Front Door entry-points
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Azure Web Application Firewall should be enabled for Azure Front Door entry-points
  Policy Category  : Network
  */
  policy_definition_reference {
    policy_definition_id = module.web_application_firewall_should_be_enabled_for_azure_front_door_entry_points_policy.policy_id
  }
  /*
  Policy Definition Reference for Latest TLS version should be used in your Web App
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Latest TLS version should be used in your Web App
  Policy Category  : App Service
  */
  policy_definition_reference {
    policy_definition_id = module.latest_tls_version_should_be_used_in_your_web_app_policy.policy_id
  }
  /*
  Policy Definition Reference for Latest TLS version should be used in your API App
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Latest TLS version should be used in your API App
  Policy Category  : App Service
  */
  policy_definition_reference {
    policy_definition_id = module.latest_tls_version_should_be_used_in_your_api_app_policy.policy_id
  }
  /*
  Policy Definition Reference for Latest TLS version should be used in your Function App
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Latest TLS version should be used in your Function App
  Policy Category  : App Service
  */
  policy_definition_reference {
    policy_definition_id = module.latest_tls_version_should_be_used_in_your_function_app_policy.policy_id
  }
  /*
  Policy Definition Reference for Azure Defender for DNS should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Azure Defender for DNS should be enabled
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.azure_defender_for_dns_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for An Azure Active Directory administrator should be provisioned for SQL servers
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : An Azure Active Directory administrator should be provisioned for SQL servers
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.an_azure_active_directory_administrator_should_be_provisioned_for_sql_servers_policy.policy_id
  }
  /*
  Policy Definition Reference for Service Fabric clusters should only use Azure Active Directory for client authentication
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Service Fabric clusters should only use Azure Active Directory for client authentication
  Policy Category  : Service Fabric
  */
  policy_definition_reference {
    policy_definition_id = module.service_fabric_clusters_should_only_use_azure_active_directory_for_client_authentication_policy.policy_id
  }
  /*
  Policy Definition Reference for Managed identity should be used in your Web App
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Managed identity should be used in your Web App
  Policy Category  : App Service
  */
  policy_definition_reference {
    policy_definition_id = module.managed_identity_should_be_used_in_your_web_app_policy.policy_id
  }
  /*
  Policy Definition Reference for Managed identity should be used in your Function App
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Managed identity should be used in your Function App
  Policy Category  : App Service
  */
  policy_definition_reference {
    policy_definition_id = module.managed_identity_should_be_used_in_your_function_app_policy.policy_id
  }
  /*
  Policy Definition Reference for Managed identity should be used in your API App
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Managed identity should be used in your API App
  Policy Category  : App Service
  */
  policy_definition_reference {
    policy_definition_id = module.managed_identity_should_be_used_in_your_api_app_policy.policy_id
  }
  /*
  Policy Definition Reference for Virtual machines' Guest Configuration extension should be deployed with system-assigned managed identity
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Virtual machines' Guest Configuration extension should be deployed with system-assigned managed identity
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.virtual_machines_guest_configuration_extension_should_be_deployed_with_system_assigned_managed_identity_policy.policy_id
  }
  /*
  Policy Definition Reference for Authentication to Linux machines should require SSH keys
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Authentication to Linux machines should require SSH keys
  Policy Category  : Guest Configuration
  */
  policy_definition_reference {
    policy_definition_id = module.authentication_to_linux_machines_should_require_ssh_keys_policy.policy_id
  }
  /*
  Policy Definition Reference for MFA should be enabled on accounts with read permissions on your subscription
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : MFA should be enabled on accounts with read permissions on your subscription
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.mfa_should_be_enabled_on_accounts_with_read_permissions_on_your_subscription_policy.policy_id
  }
  /*
  Policy Definition Reference for MFA should be enabled accounts with write permissions on your subscription
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : MFA should be enabled accounts with write permissions on your subscription
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.mfa_should_be_enabled_accounts_with_write_permissions_on_your_subscription_policy.policy_id
  }
  /*
  Policy Definition Reference for MFA should be enabled on accounts with owner permissions on your subscription
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : MFA should be enabled on accounts with owner permissions on your subscription
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.mfa_should_be_enabled_on_accounts_with_write_owner_permissions_on_your_subscription_policy.policy_id
  }
  /*
  Policy Definition Reference for A maximum of 3 owners should be designated for your subscription
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : A maximum of 3 owners should be designated for your subscription
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.a_maximum_of_3_owners_should_be_designated_for_your_subscription_policy.policy_id
  }
  /*
  Policy Definition Reference for External accounts with owner permissions should be removed from your subscription
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : External accounts with owner permissions should be removed from your subscription
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy.policy_id
  }
  /*
  Policy Definition Reference for There should be more than one owner assigned to your subscription
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : There should be more than one owner assigned to your subscription
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.there_should_be_more_than_one_owner_assigned_to_your_subscription_policy.policy_id
  }
  /*
  Policy Definition Reference for Deprecated accounts with owner permissions should be removed from your subscription
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Deprecated accounts with owner permissions should be removed from your subscription
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy.policy_id
  }
  /*
  Policy Definition Reference for External accounts with read permissions should be removed from your subscription
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : External accounts with read permissions should be removed from your subscription
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.external_accounts_with_read_permissions_should_be_removed_from_your_subscription_policy.policy_id
  }
  /*
  Policy Definition Reference for Deprecated accounts should be removed from your subscription
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Deprecated accounts should be removed from your subscription
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.deprecated_accounts_should_be_removed_from_your_subscription_policy.policy_id
  }
  /*
  Policy Definition Reference for External accounts with write permissions should be removed from your subscription
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : External accounts with write permissions should be removed from your subscription
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.external_accounts_with_write_permissions_should_be_removed_from_your_subscription_policy.policy_id
  }
  /*
  Policy Definition Reference for Role-Based Access Control (RBAC) should be used on Kubernetes Services
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Role-Based Access Control (RBAC) should be used on Kubernetes Services
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.role_Based_access_control_should_be_used_on_kubernetes_services_policy.policy_id
  }
  /*
  Policy Definition Reference for Audit usage of custom RBAC rules
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Audit usage of custom RBAC rules
  Policy Category  : General
  */
  policy_definition_reference {
    policy_definition_id = module.audit_usage_of_custom_rbac_rules_policy.policy_id
  }
  /*
  Policy Definition Reference for Azure Defender for SQL should be enabled for unprotected SQL Managed Instances
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Azure Defender for SQL should be enabled for unprotected SQL Managed Instances
  Policy Category  : SQL
  */
  policy_definition_reference {
    policy_definition_id = module.azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy.policy_id
  }
  /*
  Policy Definition Reference for Azure Defender for open-source relational databases should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Azure Defender for open-source relational databases should be enabled
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.azure_defender_for_open_source_relational_databases_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Azure Defender for SQL servers on machines should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Azure Defender for SQL servers on machines should be enabled
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.azure_defender_for_sql_servers_on_machines_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Azure Defender for Azure SQL Database servers should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Azure Defender for Azure SQL Database servers should be enabled
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.azure_defender_for_azure_sql_database_servers_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Azure Defender for Storage should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Azure Defender for Storage should be enabled
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.azure_defender_for_storage_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Secure transfer to storage accounts should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Secure transfer to storage accounts should be enabled
  Policy Category  : Storage
  */
  policy_definition_reference {
    policy_definition_id = module.secure_transfer_to_storage_accounts_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for FTPS only should be required in your Function App
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : FTPS only should be required in your Function App
  Policy Category  : App Service
  */
  policy_definition_reference {
    policy_definition_id = module.ftps_only_should_be_required_in_your_function_app_policy.policy_id
  }
  /*
  Policy Definition Reference for FTPS should be required in your Web App
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : FTPS should be required in your Web App
  Policy Category  : App Service
  */
  policy_definition_reference {
    policy_definition_id = module.ftps_should_be_required_in_your_web_app_policy.policy_id
  }
  /*
  Policy Definition Reference for Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources
  Policy Category  : App Service
  */
  policy_definition_reference {
    policy_definition_id = module.virtual_machines_should_encrypt_temp_disks_caches_and_data_flows_between_compute_and_storage_resources_policy.policy_id
  }
  /*
  Policy Definition Reference for Automation account variables should be encrypted
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Automation account variables should be encrypted
  Policy Category  : Automation
  */
  policy_definition_reference {
    policy_definition_id = module.automation_account_variables_should_be_encrypted_policy.policy_id
  }
  /*
  Policy Definition Reference for Service Fabric clusters should have the ClusterProtectionLevel property set to EncryptAndSign
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Service Fabric clusters should have the ClusterProtectionLevel property set to EncryptAndSign
  Policy Category  : Service Fabric
  */
  policy_definition_reference {
    policy_definition_id = module.service_fabric_clusters_should_have_the_cluster_protection_level_property_set_to_encrypt_and_sign_policy.policy_id
  }
  /*
  Policy Definition Reference for Transparent Data Encryption on SQL databases should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Transparent Data Encryption on SQL databases should be enabled
  Policy Category  : SQL
  */
  policy_definition_reference {
    policy_definition_id = module.transparent_data_encryption_on_sql_databases_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Key Vault keys should have an expiration date
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Key Vault keys should have an expiration date
  Policy Category  : Key Vault
  */
  policy_definition_reference {
    policy_definition_id = module.key_vault_keys_should_have_an_expiration_date_policy.policy_id
  }
  /*
  Policy Definition Reference for Key Vault secrets should have an expiration date
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Key Vault secrets should have an expiration date
  Policy Category  : Key Vault
  */
  policy_definition_reference {
    policy_definition_id = module.key_vault_secrets_should_have_an_expiration_date_policy.policy_id
  }
  /*
  Policy Definition Reference for Certificates should have the specified maximum validity period
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Certificates should have the specified maximum validity period
  Policy Category  : Key Vault
  */
  policy_definition_reference {
    policy_definition_id = module.certificates_should_have_the_specified_maximum_validity_period_policy.policy_id
  }
  /*
  Policy Definition Reference for Resource logs in Key Vault should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Resource logs in Key Vault should be enabled
  Policy Category  : Key Vault
  */
  policy_definition_reference {
    policy_definition_id = module.resource_logs_in_key_vault_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Azure Key Vault should disable public network access
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Azure Key Vault should disable public network access
  Policy Category  : Key Vault
  */
  policy_definition_reference {
    policy_definition_id = module.azure_key_vault_should_disable_public_network_access_policy.policy_id
  }
  /*
  Policy Definition Reference for Key vaults should have purge protection enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Key vaults should have purge protection enabled
  Policy Category  : Key Vault
  */
  policy_definition_reference {
    policy_definition_id = module.key_vaults_should_have_purge_protection_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Azure Defender for Key Vault should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Azure Defender for Key Vault should be enabled
  Policy Category  : Key Vault
  */
  policy_definition_reference {
    policy_definition_id = module.azure_defender_for_key_vault_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Storage accounts should be migrated to new Azure Resource Manager resources
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Storage accounts should be migrated to new Azure Resource Manager resources
  Policy Category  : Storage
  */
  policy_definition_reference {
    policy_definition_id = module.storage_accounts_should_be_migrated_to_new_azure_resource_ranager_resources_policy.policy_id
  }
  /*
  Policy Definition Reference for Virtual machines should be migrated to new Azure Resource Manager resources
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Virtual machines should be migrated to new Azure Resource Manager resources
  Policy Category  : Compute
  */
  policy_definition_reference {
    policy_definition_id = module.virtual_machines_should_be_migrated_to_new_azure_resource_ranager_resources_policy.policy_id
  }
  /*
  Policy Definition Reference for Azure Defender for Resource Manager should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Azure Defender for Resource Manager should be enabled
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.azure_defender_for_resource_manager_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Resource logs in Logic Apps should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Resource logs in Logic Apps should be enabled
  Policy Category  : Logic Apps
  */
  policy_definition_reference {
    policy_definition_id = module.resource_logs_in_logic_apps_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Resource logs in App Services should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Resource logs in App Services should be enabled
  Policy Category  : App Service
  */
  policy_definition_reference {
    policy_definition_id = module.resource_logs_in_app_services_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Resource logs in Service Bus should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Resource logs in Service Bus should be enabled
  Policy Category  : Service Bus
  */
  policy_definition_reference {
    policy_definition_id = module.resource_logs_in_service_bus_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Resource logs in Azure Stream Analytics should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Resource logs in Azure Stream Analytics should be enabled
  Policy Category  : Stream Analytics
  */
  policy_definition_reference {
    policy_definition_id = module.resource_logs_in_azure_stream_analytics_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Log Analytics agent should be installed on your virtual machine for Azure Security Center monitoring
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Log Analytics agent should be installed on your virtual machine for Azure Security Center monitoring
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.log_analytics_agent_should_be_installed_on_your_virtual_machine_for_azure_security_center_monitoring_policy.policy_id
  }
  /*
  Policy Definition Reference for Auto provisioning of the Log Analytics agent should be enabled on your subscription
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Auto provisioning of the Log Analytics agent should be enabled on your subscription
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.auto_provisioning_of_the_log_analytics_agent_should_be_enabled_on_your_subscription_policy.policy_id
  }
  /*
  Policy Definition Reference for Linux machines should have Log Analytics agent installed on Azure Arc
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Linux machines should have Log Analytics agent installed on Azure Arc
  Policy Category  : Guest Configuration
  */
  policy_definition_reference {
    policy_definition_id = module.linux_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy.policy_id
  }
  /*
  Policy Definition Reference for Log Analytics agent should be installed on your virtual machine scale sets for Azure Security Center monitoring
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Log Analytics agent should be installed on your virtual machine scale sets for Azure Security Center monitoring
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.log_analytics_agent_should_be_installed_on_your_virtual_machine_scale_sets_for_azure_security_center_monitoring_policy.policy_id
  }
  /*
  Policy Definition Reference for Windows machines should have Log Analytics agent installed on Azure Arc
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Windows machines should have Log Analytics agent installed on Azure Arc
  Policy Category  : Guest Configuration
  */
  policy_definition_reference {
    policy_definition_id = module.windows_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy.policy_id
  }
  /*
  Policy Definition Reference for SQL servers with auditing to storage account destination should be configured with 90 days retention or higher
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : SQL servers with auditing to storage account destination should be configured with 90 days retention or higher
  Policy Category  : SQL
  */
  policy_definition_reference {
    policy_definition_id = module.sql_servers_with_auditing_to_storage_account_destination_should_be_configured_with_90_days_retention_or_higher_policy.policy_id
  }
  /*
  Policy Definition Reference for Email notification to subscription owner for high severity alerts should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Email notification to subscription owner for high severity alerts should be enabled
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.email_notification_to_subscription_owner_for_high_severity_alerts_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Email notification for high severity alerts should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Email notification for high severity alerts should be enabled
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.email_notification_for_high_severity_alerts_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Network Watcher should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Network Watcher should be enabled
  Policy Category  : Network
  */
  policy_definition_reference {
    policy_definition_id = module.network_watcher_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Function apps should have 'Client Certificates (Incoming client certificates)' enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Function apps should have 'Client Certificates (Incoming client certificates)' enabled
  Policy Category  : App Service
  */
  policy_definition_reference {
    policy_definition_id = module.function_apps_should_have_client_certificates_icc_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Ensure WEB app has 'Client Certificates (Incoming client certificates)' set to 'On'
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Ensure WEB app has 'Client Certificates (Incoming client certificates)' set to 'On'
  Policy Category  : App Service
  */
  policy_definition_reference {
    policy_definition_id = module.ensure_web_app_has_client_certificates_icc_set_to_on_policy.policy_id
  }
  /*
  Policy Definition Reference for Kubernetes clusters should not use the default namespace
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Kubernetes clusters should not use the default namespace 
  Policy Category  : Kubernetes
  */
  policy_definition_reference {
    policy_definition_id = module.kubernetes_clusters_should_not_use_the_default_namespace_policy.policy_id
  }
  /*
  Policy Definition Reference for Kubernetes cluster pod hostPath volumes should only use allowed host paths
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Kubernetes cluster pod hostPath volumes should only use allowed host paths 
  Policy Category  : Kubernetes
  */
  policy_definition_reference {
    policy_definition_id = module.kubernetes_cluster_pod_hostpath_volumes_should_only_use_allowed_host_paths_policy.policy_id
  }
  /*
  Policy Definition Reference for Kubernetes cluster pods should only use approved host network and port range
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Kubernetes cluster pods should only use approved host network and port range 
  Policy Category  : Kubernetes
  */
  policy_definition_reference {
    policy_definition_id = module.kubernetes_cluster_pods_should_only_use_approved_host_network_and_port_range_policy.policy_id
  }
  /*
  Policy Definition Reference for Function App should only be accessible over HTTPS
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Function App should only be accessible over HTTPS 
  Policy Category  : App Service
  */
  policy_definition_reference {
    policy_definition_id = module.function_app_should_only_be_accessible_over_https_policy.policy_id
  }
  /*
  Policy Definition Reference for Windows Defender Exploit Guard should be enabled on your machines
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Windows Defender Exploit Guard should be enabled on your machines 
  Policy Category  : Guest Configuration
  */
  policy_definition_reference {
    policy_definition_id = module.windows_defender_exploit_guard_should_be_enabled_on_your_machines_policy.policy_id
  }
  /*
  Policy Definition Reference for Subscriptions should have a contact email address for security issues
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Subscriptions should have a contact email address for security issues 
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.subscriptions_should_have_a_contact_email_address_for_security_issues_policy.policy_id
  }
  /*
  Policy Definition Reference for Linux machines should meet requirements for the Azure compute security baseline
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Linux machines should meet requirements for the Azure compute security baseline 
  Policy Category  : Guest Configuration
  */
  policy_definition_reference {
    policy_definition_id = module.linux_machines_should_meet_requirements_for_the_azure_compute_security_baseline_policy.policy_id
  }
  /*
  Policy Definition Reference for Guest Configuration extension should be installed on your machines
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Guest Configuration extension should be installed on your machines 
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.guest_configuration_extension_should_be_installed_on_your_machines_policy.policy_id
  }
  /*
  Policy Definition Reference for Guest Attestation extension should be installed on supported Linux virtual machines
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Guest Attestation extension should be installed on supported Linux virtual machines 
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_policy.policy_id
  }
  /*
  Policy Definition Reference for Windows machines should meet requirements of the Azure compute security baseline
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Windows machines should meet requirements of the Azure compute security baseline 
  Policy Category  : Guest Configuration
  */
  policy_definition_reference {
    policy_definition_id = module.windows_machines_should_meet_requirements_of_the_azure_compute_security_baseline_policy.policy_id
  }
  /*
  Policy Definition Reference for Guest Attestation extension should be installed on supported Linux virtual machines scale sets
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Guest Attestation extension should be installed on supported Linux virtual machines scale sets 
  Policy Category  : Guest Configuration
  */
  policy_definition_reference {
    policy_definition_id = module.guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_scale_sets_policy.policy_id
  }
  /*
  Policy Definition Reference for Vulnerability assessment should be enabled on SQL Managed Instance
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Vulnerability assessment should be enabled on SQL Managed Instance 
  Policy Category  : SQL
  */
  policy_definition_reference {
    policy_definition_id = module.vulnerability_assessment_should_be_enabled_on_sql_managed_instance_policy.policy_id
  }
  /*
  Policy Definition Reference for Vulnerability assessment should be enabled on your SQL servers
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Vulnerability assessment should be enabled on your SQL servers 
  Policy Category  : SQL
  */
  policy_definition_reference {
    policy_definition_id = module.vulnerability_assessment_should_be_enabled_on_your_sql_servers_policy.policy_id
  }
  /*
  Policy Definition Reference for A vulnerability assessment solution should be enabled on your virtual machines
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : A vulnerability assessment solution should be enabled on your virtual machines 
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.a_vulnerability_assessment_solution_should_be_enabled_on_your_virtual_machines_policy.policy_id
  }
  /*
  Policy Definition Reference for SQL servers on machines should have vulnerability findings resolved
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : SQL servers on machines should have vulnerability findings resolved 
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.sql_servers_on_machines_should_have_vulnerability_findings_resolved_policy.policy_id
  }
  /*
  Policy Definition Reference for Ensure that 'Java version' is the latest, if used as a part of the Function app
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Ensure that 'Java version' is the latest, if used as a part of the Function app 
  Policy Category  : App Service
  */
  policy_definition_reference {
    policy_definition_id = module.ensure_that_java_version_is_the_latest_if_used_as_a_part_of_the_function_app_policy.policy_id
  }
  /*
  Policy Definition Reference for Ensure that 'Python version' is the latest, if used as a part of the Web app
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Ensure that 'Python version' is the latest, if used as a part of the Web app 
  Policy Category  : App Service
  */
  policy_definition_reference {
    policy_definition_id = module.ensure_that_python_version_is_the_latest_if_used_as_a_part_of_the_web_app_policy.policy_id
  }
  /*
  Policy Definition Reference for Container registry images should have vulnerability findings resolved
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Container registry images should have vulnerability findings resolved 
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.container_registry_images_should_have_vulnerability_findings_resolved_policy.policy_id
  }
  /*
  Policy Definition Reference for Ensure that 'Python version' is the latest, if used as a part of the API app
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Ensure that 'Python version' is the latest, if used as a part of the API app 
  Policy Category  : App Service
  */
  policy_definition_reference {
    policy_definition_id = module.ensure_that_python_version_is_the_latest_if_used_as_a_part_of_the_api_app_policy.policy_id
  }
  /*
  Policy Definition Reference for Azure Defender for servers should be enabled
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Azure Defender for servers should be enabled 
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.azure_defender_for_servers_should_be_enabled_policy.policy_id
  }
  /*
  Policy Definition Reference for Endpoint protection solution should be installed on virtual machine scale sets
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Endpoint protection solution should be installed on virtual machine scale sets 
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.endpoint_protection_solution_should_be_installed_on_virtual_machine_scale_sets_policy.policy_id
  }
  /*
  Policy Definition Reference for Endpoint protection should be installed on your machines
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Endpoint protection should be installed on your machines 
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.endpoint_protection_should_be_installed_on_your_machines_policy.policy_id
  }
  /*
  Policy Definition Reference for Endpoint protection health issues should be resolved on your machines
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Endpoint protection health issues should be resolved on your machines 
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy.policy_id
  }
  /*
  Policy Definition Reference for Azure Backup should be enabled for Virtual Machines
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Azure Backup should be enabled for Virtual Machines 
  Policy Category  : Backup
  */
  policy_definition_reference {
    policy_definition_id = module.azure_backup_should_be_enabled_for_virtual_machines_policy.policy_id
  }
  /*
  Policy Definition Reference for Geo-redundant backup should be enabled for Azure Database for PostgreSQL
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Geo-redundant backup should be enabled for Azure Database for PostgreSQL 
  Policy Category  : SQL
  */
  policy_definition_reference {
    policy_definition_id = module.geo_redundant_backup_should_be_enabled_for_azure_database_for_postgresql_policy.policy_id
  }
  /*
  Policy Definition Reference for Geo-redundant backup should be enabled for Azure Database for MySQL
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Geo-redundant backup should be enabled for Azure Database for MySQL 
  Policy Category  : SQL
  */
  policy_definition_reference {
    policy_definition_id = module.geo_redundant_backup_should_be_enabled_for_azure_database_for_mysql_policy.policy_id
  }
  /*
  Policy Definition Reference for Geo-redundant backup should be enabled for Azure Database for MariaDB
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Geo-redundant backup should be enabled for Azure Database for MariaDB 
  Policy Category  : SQL
  */
  policy_definition_reference {
    policy_definition_id = module.geo_redundant_backup_should_be_enabled_for_azure_database_for_mariadb_policy.policy_id
  }
  /*
  Policy Definition Reference for Vulnerabilities in container security configurations should be remediated
  Policy Type  : Custom
  Policy Mode  : All
  Policy Name  : Vulnerabilities in container security configurations should be remediated 
  Policy Category  : Security Center
  */
  policy_definition_reference {
    policy_definition_id = module.vulnerabilities_in_container_security_configurations_should_be_remediated_policy.policy_id
  }
}