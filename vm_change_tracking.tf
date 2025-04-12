// VM Change Tracking Extensions

resource "azurerm_resource_group_template_deployment" "dcr_ct" {
  name                = "deployment-${random_string.deployment_name.result}"
  resource_group_name = azurerm_resource_group.mgmt_rg.name
  deployment_mode     = "Incremental"
  parameters_content = jsonencode(
    {
      "dataCollectionRuleName" = {
        value = "dcr-${var.mg_identification}-change-001"
      }
      "workspaceResourceId" = {
        value = module.law.output_law_id
      }
    }
  )
  template_content = jsonencode(
    {
      "$schema" : "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
      "contentVersion" : "1.0.0.0",
      "parameters" : {
        "dataCollectionRuleName" : {
          "type" : "String",
          "metadata" : {
            "description" : "Specifies the name of the data collection rule to create."
          }
        },
        "workspaceResourceId" : {
          "type" : "String",
          "metadata" : {
            "description" : "Specifies the Azure resource ID of the Log Analytics workspace to use to store change tracking data."
          }
        }
      },
      "variables" : {
        "subscriptionId" : "[substring(parameters('workspaceResourceId'), 15, sub(indexOf(parameters('workspaceResourceId'), '/resourceGroups/'), 15))]",
        "resourceGroupName" : "[substring(parameters('workspaceResourceId'), add(indexOf(parameters('workspaceResourceId'), '/resourceGroups/'), 16), sub(sub(indexOf(parameters('workspaceResourceId'), '/providers/'), indexOf(parameters('workspaceResourceId'), '/resourceGroups/')),16))]",
        "workspaceName" : "[substring(parameters('workspaceResourceId'), add(lastIndexOf(parameters('workspaceResourceId'), '/'), 1), sub(length(parameters('workspaceResourceId')), add(lastIndexOf(parameters('workspaceResourceId'), '/'), 1)))]"
      },
      "resources" : [
        {
          "type" : "microsoft.resources/deployments",
          "name" : "get-workspace-region",
          "apiVersion" : "2020-08-01",
          "properties" : {
            "mode" : "Incremental",
            "template" : {
              "$schema" : "https ://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
              "contentVersion" : "1.0.0.0",
              "resources" : [],
              "outputs" : {
                "workspaceLocation" : {
                  "type" : "string",
                  "value" : "[reference(parameters('workspaceResourceId'), '2020-08-01', 'Full').location]"
                }
              }
            }
          }
        },
        {
          "type" : "microsoft.resources/deployments",
          "name" : "CtDcr-Deployment",
          "apiVersion" : "2020-08-01",
          "properties" : {
            "mode" : "Incremental",
            "parameters" : {
              "workspaceRegion" : {
                "value" : "[reference('get-workspace-region').outputs.workspaceLocation.value]"
              }
            },
            "template" : {
              "$schema" : "https ://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
              "contentVersion" : "1.0.0.0",
              "parameters" : {
                "workspaceRegion" : {
                  "type" : "string"
                }
              },
              "resources" : [
                {
                  "type" : "microsoft.insights/dataCollectionRules",
                  "apiVersion" : "2021-04-01",
                  "name" : "[parameters('dataCollectionRuleName')]",
                  "location" : "[parameters('workspaceRegion')]",
                  "properties" : {
                    "description" : "Data collection rule for CT.",
                    "dataSources" : {
                      "extensions" : [
                        {
                          "streams" : [
                            "Microsoft-ConfigurationChange",
                            "Microsoft-ConfigurationChangeV2",
                            "Microsoft-ConfigurationData"
                          ],
                          "extensionName" : "ChangeTracking-Windows",
                          "extensionSettings" : {
                            "enableFiles" : true,
                            "enableSoftware" : true,
                            "enableRegistry" : true,
                            "enableServices" : true,
                            "enableInventory" : true,
                            "registrySettings" : {
                              "registryCollectionFrequency" : 3000,
                              "registryInfo" : [
                                {
                                  "name" : "Registry_1",
                                  "groupTag" : "Recommended",
                                  "enabled" : false,
                                  "recurse" : true,
                                  "description" : "",
                                  "keyName" : "HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Group Policy\\Scripts\\Startup",
                                  "valueName" : ""
                                },
                                {
                                  "name" : "Registry_2",
                                  "groupTag" : "Recommended",
                                  "enabled" : false,
                                  "recurse" : true,
                                  "description" : "",
                                  "keyName" : "HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Group Policy\\Scripts\\Shutdown",
                                  "valueName" : ""
                                },
                                {
                                  "name" : "Registry_3",
                                  "groupTag" : "Recommended",
                                  "enabled" : false,
                                  "recurse" : true,
                                  "description" : "",
                                  "keyName" : "HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Run",
                                  "valueName" : ""
                                },
                                {
                                  "name" : "Registry_4",
                                  "groupTag" : "Recommended",
                                  "enabled" : false,
                                  "recurse" : true,
                                  "description" : "",
                                  "keyName" : "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Active Setup\\Installed Components",
                                  "valueName" : ""
                                },
                                {
                                  "name" : "Registry_5",
                                  "groupTag" : "Recommended",
                                  "enabled" : false,
                                  "recurse" : true,
                                  "description" : "",
                                  "keyName" : "HKEY_LOCAL_MACHINE\\Software\\Classes\\Directory\\ShellEx\\ContextMenuHandlers",
                                  "valueName" : ""
                                },
                                {
                                  "name" : "Registry_6",
                                  "groupTag" : "Recommended",
                                  "enabled" : false,
                                  "recurse" : true,
                                  "description" : "",
                                  "keyName" : "HKEY_LOCAL_MACHINE\\Software\\Classes\\Directory\\Background\\ShellEx\\ContextMenuHandlers",
                                  "valueName" : ""
                                },
                                {
                                  "name" : "Registry_7",
                                  "groupTag" : "Recommended",
                                  "enabled" : false,
                                  "recurse" : true,
                                  "description" : "",
                                  "keyName" : "HKEY_LOCAL_MACHINE\\Software\\Classes\\Directory\\Shellex\\CopyHookHandlers",
                                  "valueName" : ""
                                },
                                {
                                  "name" : "Registry_8",
                                  "groupTag" : "Recommended",
                                  "enabled" : false,
                                  "recurse" : true,
                                  "description" : "",
                                  "keyName" : "HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\ShellIconOverlayIdentifiers",
                                  "valueName" : ""
                                },
                                {
                                  "name" : "Registry_9",
                                  "groupTag" : "Recommended",
                                  "enabled" : false,
                                  "recurse" : true,
                                  "description" : "",
                                  "keyName" : "HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\ShellIconOverlayIdentifiers",
                                  "valueName" : ""
                                },
                                {
                                  "name" : "Registry_10",
                                  "groupTag" : "Recommended",
                                  "enabled" : false,
                                  "recurse" : true,
                                  "description" : "",
                                  "keyName" : "HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Browser Helper Objects",
                                  "valueName" : ""
                                },
                                {
                                  "name" : "Registry_11",
                                  "groupTag" : "Recommended",
                                  "enabled" : false,
                                  "recurse" : true,
                                  "description" : "",
                                  "keyName" : "HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Browser Helper Objects",
                                  "valueName" : ""
                                },
                                {
                                  "name" : "Registry_12",
                                  "groupTag" : "Recommended",
                                  "enabled" : false,
                                  "recurse" : true,
                                  "description" : "",
                                  "keyName" : "HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Internet Explorer\\Extensions",
                                  "valueName" : ""
                                },
                                {
                                  "name" : "Registry_13",
                                  "groupTag" : "Recommended",
                                  "enabled" : false,
                                  "recurse" : true,
                                  "description" : "",
                                  "keyName" : "HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Internet Explorer\\Extensions",
                                  "valueName" : ""
                                },
                                {
                                  "name" : "Registry_14",
                                  "groupTag" : "Recommended",
                                  "enabled" : false,
                                  "recurse" : true,
                                  "description" : "",
                                  "keyName" : "HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Drivers32",
                                  "valueName" : ""
                                },
                                {
                                  "name" : "Registry_15",
                                  "groupTag" : "Recommended",
                                  "enabled" : false,
                                  "recurse" : true,
                                  "description" : "",
                                  "keyName" : "HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows NT\\CurrentVersion\\Drivers32",
                                  "valueName" : ""
                                },
                                {
                                  "name" : "Registry_16",
                                  "groupTag" : "Recommended",
                                  "enabled" : false,
                                  "recurse" : true,
                                  "description" : "",
                                  "keyName" : "HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Control\\Session Manager\\KnownDlls",
                                  "valueName" : ""
                                },
                                {
                                  "name" : "Registry_17",
                                  "groupTag" : "Recommended",
                                  "enabled" : false,
                                  "recurse" : true,
                                  "description" : "",
                                  "keyName" : "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon\\Notify",
                                  "valueName" : ""
                                }
                              ]
                            },
                            "fileSettings" : {
                              "fileCollectionFrequency" : 2700
                            },
                            "softwareSettings" : {
                              "softwareCollectionFrequency" : 1800
                            },
                            "inventorySettings" : {
                              "inventoryCollectionFrequency" : 36000
                            },
                            "servicesSettings" : {
                              "serviceCollectionFrequency" : 1800
                            }
                          },
                          "name" : "CTDataSource-Windows"
                        },
                        {
                          "streams" : [
                            "Microsoft-ConfigurationChange",
                            "Microsoft-ConfigurationChangeV2",
                            "Microsoft-ConfigurationData"
                          ],
                          "extensionName" : "ChangeTracking-Linux",
                          "extensionSettings" : {
                            "enableFiles" : true,
                            "enableSoftware" : true,
                            "enableRegistry" : false,
                            "enableServices" : true,
                            "enableInventory" : true,
                            "fileSettings" : {
                              "fileCollectionFrequency" : 900,
                              "fileInfo" : [
                                {
                                  "name" : "ChangeTrackingLinuxPath_default",
                                  "enabled" : true,
                                  "destinationPath" : "/etc/.*.conf",
                                  "useSudo" : true,
                                  "recurse" : true,
                                  "maxContentsReturnable" : 5000000,
                                  "pathType" : "File",
                                  "type" : "File",
                                  "links" : "Follow",
                                  "maxOutputSize" : 500000,
                                  "groupTag" : "Recommended"
                                }
                              ]
                            },
                            "softwareSettings" : {
                              "softwareCollectionFrequency" : 300
                            },
                            "inventorySettings" : {
                              "inventoryCollectionFrequency" : 36000
                            },
                            "servicesSettings" : {
                              "serviceCollectionFrequency" : 300
                            }
                          },
                          "name" : "CTDataSource-Linux"
                        }
                      ]
                    },
                    "destinations" : {
                      "logAnalytics" : [
                        {
                          "workspaceResourceId" : "[parameters('workspaceResourceId')]",
                          "name" : "Microsoft-CT-Dest"
                        }
                      ]
                    },
                    "dataFlows" : [
                      {
                        "streams" : [
                          "Microsoft-ConfigurationChange",
                          "Microsoft-ConfigurationChangeV2",
                          "Microsoft-ConfigurationData"
                        ],
                        "destinations" : [
                          "Microsoft-CT-Dest"
                        ]
                      }
                    ]
                  }
                },
                {
                  "type" : "microsoft.operationsManagement/solutions",
                  "name" : "[Concat('ChangeTracking', '(', variables('workspaceName'), ')')]",
                  "location" : "[parameters('workspaceRegion')]",
                  "apiVersion" : "2015-11-01-preview",
                  "id" : "[Concat('/subscriptions/', variables('subscriptionId'), '/resourceGroups/', variables('resourceGroupName'), '/providers/microsoft.operationsManagement/solutions/ChangeTracking', '(', variables('workspaceName'), ')')]",
                  "properties" : {
                    "workspaceResourceId" : "[parameters('workspaceResourceId')]"
                  },
                  "plan" : {
                    "name" : "[Concat('ChangeTracking', '(', variables('workspaceName'), ')')]",
                    "product" : "OMSGallery/ChangeTracking",
                    "promotionCode" : "",
                    "publisher" : "Microsoft"
                  }
                }
              ]
            }
          }
        }
      ],
      "outputs" : {
        "dcrId" : {
          "type" : "String",
          "value" : "[resourceId('microsoft.insights/dataCollectionRules', parameters('dataCollectionRuleName'))]"
        }
      }
    }
  )
  # provider = azurerm.management
}

module "vm_change_tracking_assign" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-change-inventory"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.vm_change_tracking_policy_display_name}"
  policy_assignment_location     = var.location
  definition_id                  = "/providers/Microsoft.Authorization/policySetDefinitions/92a36f05-ebc9-4bba-9128-b47ad2ea3354"
  mg_id                          = data.azurerm_management_group.ccc.id
  policy_assignment_param = jsonencode(
    {
      "bringYourOwnUserAssignedManagedIdentity" : {
        "type" : "Boolean",
        "metadata" : {
          "displayName" : "Bring Your Own User-Assigned Identity",
          "description" : "Enable this to use your pre-created user-assigned managed identity. The pre-created identity MUST exist within the subscription otherwise the policy deployment will fail. If enabled, ensure that the User-Assigned Identity Name and Identity Resource Group Name parameters match the pre-created identity. If not enabled, the policy will create per subscription, per resource user-assigned managed identities in a new resource group named 'Built-In-Identity-RG'."
        },
        "value" : false
      },
      "dcrResourceId" : {
        "type" : "String",
        "metadata" : {
          "displayName" : "Data Collection Rule Resource Id",
          "description" : "Resource Id of the Data Collection Rule to be applied on the virtual machines in scope."
        },
        "value" : jsondecode(azurerm_resource_group_template_deployment.dcr_ct.output_content).dcrId.value
      }
    }
  )
  depends_on = [
    azurerm_resource_group_template_deployment.dcr_ct
  ]
}

module "vm_change_tracking_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.vm_change_tracking_assign.output_principle_id
}