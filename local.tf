// Locals

locals {
  gen_condition = {
    "Linux" = {
      rule = jsonencode(
        {
          "allOf" : [
            {
              "field" : "type",
              "equals" : "Microsoft.Compute/virtualMachines"
            },
            {
              "field" : "location",
              "in" : "[parameters('listOfApplicableLocations')]"
            },
            {
              "anyOf" : [
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "RedHat"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "in" : [
                        "RHEL",
                        "RHEL-ARM64",
                        "RHEL-BYOS",
                        "RHEL-HA",
                        "RHEL-SAP",
                        "RHEL-SAP-APPS",
                        "RHEL-SAP-HA"
                      ]
                    },
                    {
                      "anyOf" : [
                        {
                          "field" : "Microsoft.Compute/imageSku",
                          "like" : "7*"
                        },
                        {
                          "field" : "Microsoft.Compute/imageSku",
                          "like" : "8*"
                        },
                        {
                          "field" : "Microsoft.Compute/imageSku",
                          "like" : "rhel-lvm7*"
                        },
                        {
                          "field" : "Microsoft.Compute/imageSku",
                          "like" : "rhel-lvm8*"
                        }
                      ]
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "SUSE"
                    },
                    {
                      "anyOf" : [
                        {
                          "allOf" : [
                            {
                              "field" : "Microsoft.Compute/imageOffer",
                              "in" : [
                                "SLES",
                                "SLES-HPC",
                                "SLES-HPC-Priority",
                                "SLES-SAP",
                                "SLES-SAP-BYOS",
                                "SLES-Priority",
                                "SLES-BYOS",
                                "SLES-SAPCAL",
                                "SLES-Standard"
                              ]
                            },
                            {
                              "anyOf" : [
                                {
                                  "field" : "Microsoft.Compute/imageSku",
                                  "like" : "12*"
                                },
                                {
                                  "field" : "Microsoft.Compute/imageSku",
                                  "like" : "15*"
                                }
                              ]
                            }
                          ]
                        },
                        {
                          "allOf" : [
                            {
                              "anyOf" : [
                                {
                                  "field" : "Microsoft.Compute/imageOffer",
                                  "like" : "sles-12*"
                                },
                                {
                                  "field" : "Microsoft.Compute/imageOffer",
                                  "like" : "sles-15*"
                                }
                              ]
                            },
                            {
                              "field" : "Microsoft.Compute/imageSku",
                              "in" : [
                                "gen1",
                                "gen2"
                              ]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "Canonical"
                    },
                    {
                      "anyOf" : [
                        {
                          "field" : "Microsoft.Compute/imageOffer",
                          "equals" : "UbuntuServer"
                        },
                        {
                          "field" : "Microsoft.Compute/imageOffer",
                          "like" : "0001-com-ubuntu-server-*"
                        },
                        {
                          "field" : "Microsoft.Compute/imageOffer",
                          "like" : "0001-com-ubuntu-pro-*"
                        }
                      ]
                    },
                    {
                      "field" : "Microsoft.Compute/imageSku",
                      "in" : [
                        "14.04.0-lts",
                        "14.04.1-lts",
                        "14.04.2-lts",
                        "14.04.3-lts",
                        "14.04.4-lts",
                        "14.04.5-lts",
                        "16_04_0-lts-gen2",
                        "16_04-lts-gen2",
                        "16.04-lts",
                        "16.04.0-lts",
                        "18_04-lts-arm64",
                        "18_04-lts-gen2",
                        "18.04-lts",
                        "20_04-lts-arm64",
                        "20_04-lts-gen2",
                        "20_04-lts",
                        "22_04-lts-gen2",
                        "22_04-lts",
                        "pro-16_04-lts-gen2",
                        "pro-16_04-lts",
                        "pro-18_04-lts-gen2",
                        "pro-18_04-lts",
                        "pro-20_04-lts-gen2",
                        "pro-20_04-lts",
                        "pro-22_04-lts-gen2",
                        "pro-22_04-lts"
                      ]
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "Oracle"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "equals" : "Oracle-Linux"
                    },
                    {
                      "anyOf" : [
                        {
                          "field" : "Microsoft.Compute/imageSku",
                          "like" : "7*"
                        },
                        {
                          "field" : "Microsoft.Compute/imageSku",
                          "like" : "8*"
                        }
                      ]
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "OpenLogic"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "in" : [
                        "CentOS",
                        "Centos-LVM",
                        "CentOS-SRIOV"
                      ]
                    },
                    {
                      "anyOf" : [
                        {
                          "field" : "Microsoft.Compute/imageSku",
                          "like" : "6*"
                        },
                        {
                          "field" : "Microsoft.Compute/imageSku",
                          "like" : "7*"
                        },
                        {
                          "field" : "Microsoft.Compute/imageSku",
                          "like" : "8*"
                        }
                      ]
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "cloudera"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "equals" : "cloudera-centos-os"
                    },
                    {
                      "field" : "Microsoft.Compute/imageSku",
                      "like" : "7*"
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "almalinux"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "equals" : "almalinux"
                    },
                    {
                      "field" : "Microsoft.Compute/imageSku",
                      "like" : "8*"
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "ctrliqinc1648673227698"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "like" : "rocky-8*"
                    },
                    {
                      "field" : "Microsoft.Compute/imageSku",
                      "like" : "rocky-8*"
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "credativ"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "in" : [
                        "Debian"
                      ]
                    },
                    {
                      "field" : "Microsoft.Compute/imageSku",
                      "equals" : "9"
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "Debian"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "in" : [
                        "debian-10",
                        "debian-11"
                      ]
                    },
                    {
                      "field" : "Microsoft.Compute/imageSku",
                      "in" : [
                        "10",
                        "10-gen2",
                        "11",
                        "11-gen2"
                      ]
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "microsoftcblmariner"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "equals" : "cbl-mariner"
                    },
                    {
                      "field" : "Microsoft.Compute/imageSku",
                      "in" : [
                        "1-gen2",
                        "cbl-mariner-1",
                        "cbl-mariner-2",
                        "cbl-mariner-2-arm64",
                        "cbl-mariner-2-gen2"
                      ]
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "zscaler"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "equals" : "zscaler-private-access"
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "plesk"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "equals" : "solution-server-wordpress"
                    }
                  ]
                }
              ]
            }
          ]
        }
      )
      dependency_agent_name      = "DependencyAgentLinux"
      dependency_agent_type      = "DependencyAgentLinux"
      dependency_agent_publisher = "Microsoft.Azure.Monitoring.DependencyAgent"
      dependency_agent_version   = "9.10"
      guest_config_name          = "AzurePolicyforLinux"
      guest_config_type          = "ConfigurationForLinux"
      guest_config_publisher     = "Microsoft.GuestConfiguration"
      guest_config_version       = "1.0"
      aad_login_name             = "AADSSHLoginForLinux"
      aad_login_publisher        = "Microsoft.Azure.ActiveDirectory"
      aad_login_type             = "AADSSHLoginForLinux"
      aad_login_version          = "1.0"
    }
    "Windows" = {
      rule = jsonencode(
        {
          "allOf" : [
            {
              "field" : "type",
              "equals" : "Microsoft.Compute/virtualMachines"
            },
            {
              "field" : "location",
              "in" : "[parameters('listOfApplicableLocations')]"
            },
            {
              "anyOf" : [
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "MicrosoftWindowsServer"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "equals" : "WindowsServer"
                    },
                    {
                      "anyOf" : [
                        {
                          "field" : "Microsoft.Compute/imageSku",
                          "like" : "2008-R2-SP1*"
                        },
                        {
                          "field" : "Microsoft.Compute/imageSku",
                          "like" : "2012-*"
                        },
                        {
                          "field" : "Microsoft.Compute/imageSku",
                          "like" : "2016-*"
                        },
                        {
                          "field" : "Microsoft.Compute/imageSku",
                          "like" : "2019-*"
                        },
                        {
                          "field" : "Microsoft.Compute/imageSku",
                          "like" : "2022-*"
                        }
                      ]
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "MicrosoftWindowsServer"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "equals" : "WindowsServerSemiAnnual"
                    },
                    {
                      "field" : "Microsoft.Compute/imageSKU",
                      "in" : [
                        "Datacenter-Core-1709-smalldisk",
                        "Datacenter-Core-1709-with-Containers-smalldisk",
                        "Datacenter-Core-1803-with-Containers-smalldisk"
                      ]
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "MicrosoftWindowsServerHPCPack"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "equals" : "WindowsServerHPCPack"
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "MicrosoftSQLServer"
                    },
                    {
                      "anyOf" : [
                        {
                          "field" : "Microsoft.Compute/imageOffer",
                          "like" : "*-WS2022"
                        },
                        {
                          "field" : "Microsoft.Compute/imageOffer",
                          "like" : "*-WS2022-BYOL"
                        },
                        {
                          "field" : "Microsoft.Compute/imageOffer",
                          "like" : "*-WS2019"
                        },
                        {
                          "field" : "Microsoft.Compute/imageOffer",
                          "like" : "*-WS2019-BYOL"
                        },
                        {
                          "field" : "Microsoft.Compute/imageOffer",
                          "like" : "*-WS2016"
                        },
                        {
                          "field" : "Microsoft.Compute/imageOffer",
                          "like" : "*-WS2016-BYOL"
                        },
                        {
                          "field" : "Microsoft.Compute/imageOffer",
                          "like" : "*-WS2012R2"
                        },
                        {
                          "field" : "Microsoft.Compute/imageOffer",
                          "like" : "*-WS2012R2-BYOL"
                        }
                      ]
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "MicrosoftRServer"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "equals" : "MLServer-WS2016"
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "MicrosoftVisualStudio"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "in" : [
                        "VisualStudio",
                        "Windows"
                      ]
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "MicrosoftDynamicsAX"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "equals" : "Dynamics"
                    },
                    {
                      "anyOf" : [
                        {
                          "field" : "Microsoft.Compute/imageSKU",
                          "in" : [
                            "Pre-Req-AX7-Onebox-U8",
                            "Pre-Req-AX7-Onebox-V7",
                            "Pre-Req-AX7-Onebox-V6",
                            "Pre-Req-AX7-Onebox-VSENT-V6"
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "microsoft-ads"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "equals" : "windows-data-science-vm"
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "MicrosoftWindowsDesktop"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "in" : [
                        "Windows-10",
                        "Office-365"
                      ]
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "help-systems"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "in" : [
                        "goanywheremftwindows"
                      ]
                    }
                  ]
                },
                {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "equals" : "microsoft-hyperv"
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "equals" : "windows10preview"
                    }
                  ]
                }
              ]
            }
          ]
        }
      )
      dependency_agent_name      = "DependencyAgentWindows"
      dependency_agent_type      = "DependencyAgentWindows"
      dependency_agent_publisher = "Microsoft.Azure.Monitoring.DependencyAgent"
      dependency_agent_version   = "9.10"
      guest_config_name          = "AzurePolicyforWindows"
      guest_config_type          = "ConfigurationforWindows"
      guest_config_publisher     = "Microsoft.GuestConfiguration"
      guest_config_version       = "1.0"
      aad_login_name             = "AADLoginForWindows"
      aad_login_publisher        = "Microsoft.Azure.ActiveDirectory"
      aad_login_type             = "AADLoginForWindows"
      aad_login_version          = "1.0"
    }
  }
  arc_condition = {
    "Linux" = {
      rule = jsonencode(
        {
          "allOf" : [
            {
              "field" : "type",
              "equals" : "Microsoft.HybridCompute/machines"
            },
            {
              "field" : "location",
              "in" : "[parameters('listOfApplicableLocations')]"
            },
            {
              "field" : "Microsoft.HybridCompute/imageOffer",
              "like" : "linux*"
            }
          ]
        }
      )
      guest_config_name      = "AzurePolicyforLinux"
      guest_config_type      = "ConfigurationForLinux"
      guest_config_publisher = "Microsoft.GuestConfiguration"
      guest_config_version   = "1.0"
      aad_login_name         = "AADSSHLoginForLinux"
      aad_login_publisher    = "Microsoft.Azure.ActiveDirectory"
      aad_login_type         = "AADSSHLoginForLinux"
      aad_login_version      = "1.0"
    }
    "Windows" = {
      rule = jsonencode(
        {
          "allOf" : [
            {
              "field" : "type",
              "equals" : "Microsoft.HybridCompute/machines"
            },
            {
              "field" : "Microsoft.HybridCompute/imageOffer",
              "like" : "windows*"
            },
            {
              "field" : "location",
              "in" : "[parameters('listOfApplicableLocations')]"
            }
          ]
        }
      )
      guest_config_name      = "AzurePolicyforWindows"
      guest_config_type      = "ConfigurationforWindows"
      guest_config_publisher = "Microsoft.GuestConfiguration"
      guest_config_version   = "1.0"
      aad_login_name         = "AADLoginForWindows"
      aad_login_publisher    = "Microsoft.Azure.ActiveDirectory"
      aad_login_type         = "AADLoginForWindows"
      aad_login_version      = "1.0"
    }
  }
  builtin-policy = {
    "asb" = {
      display_name = "${upper(var.mg_identification)} - Azure Security Benchmark"
      definition   = "/providers/Microsoft.Authorization/policySetDefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8"
      rbac_def     = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
    }
    "nist" = {
      display_name = "${upper(var.mg_identification)} - NIST SP 800-53 R5"
      definition   = "/providers/Microsoft.Authorization/policySetDefinitions/179d1daa-458f-4e47-8086-2a68d0d6c38f"
      rbac_def     = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
    }
    "cis" = {
      display_name = "${upper(var.mg_identification)} - CIS Microsoft Azure Foundations Benchmark v1.4.0"
      definition   = "/providers/Microsoft.Authorization/policySetDefinitions/c3f5c4d9-9a1d-4a99-85c0-7f93e384d5c5"
      rbac_def     = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
    }
  }
  alllog_def = {
    "vnet" = {
      display_name  = "Deploy Diagnostic Settings for Virtual Network"
      resource_type = "microsoft.network/virtualnetworks"
    }
    "firewall" = {
      display_name  = "Deploy Diagnostic Settings for Azure Firewall"
      resource_type = "microsoft.network/azurefirewalls"
    }
    "aad" = {
      display_name  = "Deploy Diagnostic Settings for Azure Active Directory"
      resource_type = "microsoft.aad/domainservices"
    }
    "api-mgmt" = {
      display_name  = "Deploy Diagnostic Settings for API Management Service"
      resource_type = "microsoft.apimanagement/service"
    }
    "app-config" = {
      display_name  = "Deploy Diagnostic Settings for App Configuration"
      resource_type = "microsoft.appconfiguration/configurationstores"
    }
    "aa" = {
      display_name  = "Deploy Diagnostic Settings for Automation Accounts"
      resource_type = "microsoft.automation/automationaccounts"
    }
    "container-ins" = {
      display_name  = "Deploy Diagnostic Settings for Container Instance"
      resource_type = "microsoft.containerinstance/containergroups"
    }
    "container-reg" = {
      display_name  = "Deploy Diagnostic Settings for Container Registries"
      resource_type = "microsoft.containerregistry/registries"
    }
    "grafana" = {
      display_name  = "Deploy Diagnostic Settings for Grafana"
      resource_type = "microsoft.dashboard/grafana"
    }
    "databricks" = {
      display_name  = "Deploy Diagnostic Settings for Databrics Workspace"
      resource_type = "microsoft.databricks/workspaces"
    }
    "datafactories" = {
      display_name  = "Deploy Diagnostic Settings for Data Factory"
      resource_type = "microsoft.datafactory/factories"
    }
    "datalake" = {
      display_name  = "Deploy Diagnostic Settings for Datalake Analysis"
      resource_type = "microsoft.datalakeanalytics/accounts"
    }
    "backup-vault" = {
      display_name  = "Deploy Diagnostic Settings for Backup Vault"
      resource_type = "microsoft.dataprotection/backupvaults"
    }
    "app-insights" = {
      display_name  = "Deploy Diagnostic Settings for Application Insights"
      resource_type = "microsoft.insights/components"
    }
    "key-vaults" = {
      display_name  = "Deploy Diagnostic Settings for Key Vaults"
      resource_type = "microsoft.keyvault/vaults"
    }
    "logic-app" = {
      display_name  = "Deploy Diagnostic Settings for Logic App"
      resource_type = "microsoft.logic/workflows"
    }
    "app-gateway" = {
      display_name  = "Deploy Diagnostic Settings for Application Gateway"
      resource_type = "microsoft.network/applicationgateways"
    }
    "bastion" = {
      display_name  = "Deploy Diagnostic Settings for Bastion Host"
      resource_type = "microsoft.network/bastionhosts"
    }
    "load-balancer" = {
      display_name  = "Deploy Diagnostic Settings for Load Balancer"
      resource_type = "microsoft.network/loadbalancers"
    }
    "network-manager" = {
      display_name  = "Deploy Diagnostic Settings for Network Manager"
      resource_type = "microsoft.network/networkmanagers"
    }
    "nsg" = {
      display_name  = "Deploy Diagnostic Settings for Network Security Group"
      resource_type = "microsoft.network/networksecuritygroups"
    }
    "pip" = {
      display_name  = "Deploy Diagnostic Settings for Public Ip Address"
      resource_type = "microsoft.network/publicipaddresses"
    }
    "vnetgw" = {
      display_name  = "Deploy Diagnostic Settings for Virtual Network Gateway"
      resource_type = "microsoft.network/virtualnetworkgateways"
    }
    "rsv" = {
      display_name  = "Deploy Diagnostic Settings for Recovery Service Vault"
      resource_type = "microsoft.recoveryservices/vaults"
    }
    "redis" = {
      display_name  = "Deploy Diagnostic Settings for Redis Cache"
      resource_type = "microsoft.cache/redisenterprise/databases"
    }
    "mariadb" = {
      display_name  = "Deploy Diagnostic Settings for Maria DB"
      resource_type = "microsoft.dbformariadb/servers"
    }
    "mysql" = {
      display_name  = "Deploy Diagnostic Settings for MySQL"
      resource_type = "microsoft.dbformysql/servers"
    }
    "cosmosdb" = {
      display_name  = "Deploy Diagnostic Settings for Cosmos DB"
      resource_type = "microsoft.documentdb/databaseaccounts"
    }
    "sql-managed" = {
      display_name  = "Deploy Diagnostic Settings for SQl Managed Instance"
      resource_type = "microsoft.sql/managedinstances"
    }
    "managed-db" = {
      display_name  = "Deploy Diagnostic Settings for SQL Managed Database"
      resource_type = "microsoft.sql/managedinstances/databases"
    }
    "sqldb" = {
      display_name  = "Deploy Diagnostic Settings for SQL Database"
      resource_type = "microsoft.sql/servers/databases"
    }
    "synapse-ws" = {
      display_name  = "Deploy Diagnostic Settings for Synapse Workspace"
      resource_type = "microsoft.synapse/workspaces"
    }
    "synapse-pool" = {
      display_name  = "Deploy Diagnostic Settings for Synapse SQL Pool"
      resource_type = "microsoft.synapse/workspaces/sqlpools"
    }
  }
  sa_diag = {
    def_ids = {
      "sa_main" = {
        id = "/providers/Microsoft.Authorization/policyDefinitions/59759c62-9a22-4cdf-ae64-074495983fef"
      }
      "blob" = {
        id = "/providers/Microsoft.Authorization/policyDefinitions/b4fe1a3b-0715-4c6c-a5ea-ffc33cf823cb"
      }
      "file" = {
        id = "/providers/Microsoft.Authorization/policyDefinitions/25a70cc8-2bd4-47f1-90b6-1478e4662c96"
      }
      "table" = {
        id = "/providers/Microsoft.Authorization/policyDefinitions/2fb86bf3-d221-43d1-96d1-2434af34eaa0"
      }
      "queue" = {
        id = "/providers/Microsoft.Authorization/policyDefinitions/7bd000e3-37c7-4928-9f31-86c4b77c5c45"
      }
    }
    def_set_param = jsonencode(
      {
        "logAnalytics" : {
          "type" : "String",
          "metadata" : {
            "displayName" : "Log Analytics workspace",
            "description" : "Log Analytics Workspace",
            "strongType" : "omsWorkspace",
            "assignPermissions" : true
          },
          "value" : module.law.output_law_id
        },
        "profileName" : {
          "type" : "String",
          "metadata" : {
            "displayName" : "Profile name",
            "description" : "The diagnostic settings profile name"
          },
          "value" : "setByCustomPolicy-LogAnalytics"
        }
      }
    )
  }
  alerts = {
    "srvc_advisory" = {
      display_name  = "Deploy Service Health Advisory Alert"
      incident_type = "ActionRequired"
    }
    "srvc_incident" = {
      display_name  = "Deploy Service Health Incident Alert"
      incident_type = "Incident"
    }
    "srvc_maintenance" = {
      display_name  = "Deploy Service Health Maintenance Alert"
      incident_type = "Maintenance"
    }
    "srvc_security" = {
      display_name  = "Deploy Service Health Security Alert"
      incident_type = "Security"
    }
  }
}