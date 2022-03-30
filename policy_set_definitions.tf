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
}