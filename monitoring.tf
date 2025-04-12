// Monitoring

# Baseline Alerts

resource "azurerm_resource_provider_registration" "alert_registration" {
  name = "Microsoft.AlertsManagement"
}

resource "azurerm_monitor_action_group" "action_group" {
  name                = "${var.mg_identification}-${var.action_group_name}"
  resource_group_name = azurerm_resource_group.mgmt_rg.name
  short_name          = "${var.mg_identification}-${var.action_group_short_name}"
  email_receiver {
    name                    = "${var.mg_identification}-${var.action_group_name}-email"
    email_address           = var.action_group_email
    use_common_alert_schema = true
  }
  tags = merge(
    {
      Type = "Monitor Action Group"
    },
    var.default_tags
  )
  depends_on = [
    azurerm_resource_provider_registration.alert_registration
  ]
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_monitor_alert_processing_rule_action_group" "alert_rule" {
  name                 = "${var.mg_identification}-${var.action_group_name}-alert"
  resource_group_name  = azurerm_resource_group.mgmt_rg.name
  scopes               = ["/subscriptions/${data.azurerm_client_config.me.subscription_id}"]
  add_action_group_ids = [azurerm_monitor_action_group.action_group.id]
  tags = merge(
    {
      Type = "Monitor Alert Rule"
    },
    var.default_tags
  )
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

module "service_alert_def" {
  source                  = "./modules/policy/definition"
  for_each                = local.alerts
  definition_name         = "${var.mg_identification}-${each.key}-alert"
  definition_display_name = "${upper(var.mg_identification)} - ${each.value.display_name}"
  definition_mode         = "All"
  mg_id                   = data.azurerm_management_group.ccc.id
  definition_metadata = jsonencode(
    {
      "category" : "Monitoring"
    }
  )
  definition_policy_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.Resources/subscriptions"
          },
          {
            "field" : "[concat('tags[', parameters('MonitorDisable'), ']')]",
            "notEquals" : "true"
          }
        ]
      },
      "then" : {
        "effect" : "deployIfNotExists",
        "details" : {
          "roleDefinitionIds" : [
            "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c",
            "/providers/Microsoft.Authorization/roleDefinitions/18d7d88d-d35e-4fb5-a5c3-7773c20a72d9",
            "/providers/microsoft.authorization/roleDefinitions/749f88d5-cbae-40b8-bcfc-e573ddc772fa"
          ],
          "type" : "Microsoft.Insights/activityLogAlerts",
          "existenceScope" : "resourcegroup",
          "resourceGroupName" : "[parameters('alertResourceGroupName')]",
          "deploymentScope" : "subscription",
          "existenceCondition" : {
            "allOf" : [
              {
                "field" : "Microsoft.Insights/ActivityLogAlerts/enabled",
                "equals" : "[parameters('enabled')]"
              },
              {
                "count" : {
                  "field" : "Microsoft.Insights/ActivityLogAlerts/condition.allOf[*]",
                  "where" : {
                    "anyOf" : [
                      {
                        "allOf" : [
                          {
                            "field" : "Microsoft.Insights/ActivityLogAlerts/condition.allOf[*].field",
                            "equals" : "category"
                          },
                          {
                            "field" : "Microsoft.Insights/ActivityLogAlerts/condition.allOf[*].equals",
                            "equals" : "ServiceHealth"
                          }
                        ]
                      },
                      {
                        "allOf" : [
                          {
                            "field" : "microsoft.insights/activityLogAlerts/condition.allOf[*].field",
                            "equals" : "properties.incidentType"
                          },
                          {
                            "field" : "microsoft.insights/activityLogAlerts/condition.allOf[*].equals",
                            "equals" : each.value.incident_type
                          }
                        ]
                      }
                    ]
                  }
                },
                "greaterOrEquals" : 1
              }
            ]
          },
          "deployment" : {
            "location" : var.location,
            "properties" : {
              "mode" : "incremental",
              "template" : {
                "$schema" : "https ://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
                "contentVersion" : "1.0.0.0",
                "parameters" : {
                  "alertResourceGroupName" : {
                    "type" : "string"
                  },
                  "alertResourceGroupTags" : {
                    "type" : "object"
                  },
                  "alertResourceGroupLocation" : {
                    "type" : "string"
                  },
                  "ALZMonitorActionGroupEmail" : {
                    "type" : "string"
                  },
                  "enabled" : {
                    "type" : "string"
                  }
                },
                "variables" : {
                  "varALZMonitorActionGroupEmail" : "[array(split(parameters('ALZMonitorActionGroupEmail'),','))]"
                },
                "resources" : [
                  {
                    "type" : "Microsoft.Resources/resourceGroups",
                    "apiVersion" : "2021-04-01",
                    "name" : "[parameters('alertResourceGroupName')]",
                    "location" : "[parameters('alertResourceGroupLocation')]",
                    "tags" : "[parameters('alertResourceGroupTags')]"
                  },
                  {
                    "type" : "Microsoft.Resources/deployments",
                    "apiVersion" : "2019-10-01",
                    "name" : "ServiceHealthIncident",
                    "resourceGroup" : "[parameters('alertResourceGroupName')]",
                    "dependsOn" : [
                      "[concat('Microsoft.Resources/resourceGroups/', parameters('alertResourceGroupName'))]"
                    ],
                    "properties" : {
                      "mode" : "Incremental",
                      "template" : {
                        "$schema" : "https ://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
                        "contentVersion" : "1.0.0.0",
                        "parameters" : {
                          "enabled" : {
                            "type" : "string"
                          },
                          "alertResourceGroupName" : {
                            "type" : "string"
                          },
                          "ALZMonitorActionGroupEmail" : {
                            "type" : "string"
                          }
                        },
                        "variables" : {},
                        "resources" : [
                          {
                            "type" : "microsoft.insights/activityLogAlerts",
                            "apiVersion" : "2020-10-01",
                            "name" : "ServiceHealthIncident",
                            "location" : "global",
                            "tags" : {
                              "deployed_by_policy" : true
                            },
                            "properties" : {
                              "actions" : {
                                "actionGroups" : [
                                  {
                                    "actionGroupId" : azurerm_monitor_action_group.action_group.id
                                  }
                                ]
                              },
                              "description" : "ServiceHealthIncidentAlert",
                              "enabled" : "[parameters('enabled')]",
                              "scopes" : [
                                data.azurerm_client_config.me.subscription_id
                              ],
                              "condition" : {
                                "allOf" : [
                                  {
                                    "field" : "category",
                                    "equals" : "ServiceHealth"
                                  },
                                  {
                                    "field" : "properties.incidentType",
                                    "equals" : each.value.incident_type
                                  }
                                ]
                              },
                              "parameters" : {
                                "enabled" : {
                                  "value" : "[parameters('enabled')]"
                                }
                              }
                            }
                          },
                          {
                            "type" : "Microsoft.Insights/actionGroups",
                            "apiVersion" : "2022-06-01",
                            "name" : azurerm_monitor_action_group.action_group.name,
                            "location" : "global",
                            "tags" : {
                              "deployed_by_policy" : true
                            },
                            "properties" : {
                              "groupShortName" : azurerm_monitor_action_group.action_group.short_name,
                              "enabled" : true,
                              "copy" : [
                                {
                                  "name" : "emailReceivers",
                                  "count" : "[length(variables('varALZMonitorActionGroupEmail'))]",
                                  "mode" : "serial",
                                  "input" : {
                                    "name" : "[concat('AlzMail-', indexOf(variables('varALZMonitorActionGroupEmail'), variables('varALZMonitorActionGroupEmail')[copyIndex('emailReceivers')]))]",
                                    "emailAddress" : "[trim(variables('varALZMonitorActionGroupEmail')[copyIndex('emailReceivers')])]",
                                    "useCommonSchema" : true
                                  }
                                }
                              ]
                            }
                          }
                        ]
                      },
                      "parameters" : {
                        "enabled" : {
                          "value" : "[parameters('enabled')]"
                        },
                        "alertResourceGroupName" : {
                          "value" : "[parameters('alertResourceGroupName')]"
                        },
                        "ALZMonitorActionGroupEmail" : {
                          "value" : "[parameters('ALZMonitorActionGroupEmail')]"
                        }
                      }
                    }
                  }
                ]
              },
              "parameters" : {
                "enabled" : {
                  "value" : "[parameters('enabled')]"
                },
                "alertResourceGroupName" : {
                  "value" : "[parameters('alertResourceGroupName')]"
                },
                "alertResourceGroupTags" : {
                  "value" : "[parameters('alertResourceGroupTags')]"
                },
                "alertResourceGroupLocation" : {
                  "value" : "[parameters('alertResourceGroupLocation')]"
                },
                "ALZMonitorActionGroupEmail" : {
                  "value" : "[parameters('ALZMonitorActionGroupEmail')]"
                }
              }
            }
          }
        }
      }
    }
  )
  definition_parameters = jsonencode(
    {
      "enabled" : {
        "type" : "String",
        "metadata" : {
          "displayName" : "Alert State",
          "description" : "Alert state for the alert"
        },
        "allowedValues" : [
          "true",
          "false"
        ],
        "defaultValue" : "true"
      },
      "alertResourceGroupName" : {
        "type" : "String",
        "metadata" : {
          "displayName" : "Resource Group Name",
          "description" : "Resource group the alert is placed in"
        },
        "defaultValue" : azurerm_resource_group.mgmt_rg.name
      },
      "alertResourceGroupTags" : {
        "type" : "Object",
        "metadata" : {
          "displayName" : "Resource Group Tags",
          "description" : "Tags on the Resource group the alert is placed in"
        },
        "defaultValue" : {
          "deployed_by_policy" : true
        }
      },
      "alertResourceGroupLocation" : {
        "type" : "String",
        "metadata" : {
          "displayName" : "Resource Group Location",
          "description" : "Location of the Resource group the alert is placed in"
        },
        "defaultValue" : azurerm_resource_group.mgmt_rg.location
      },
      "ALZMonitorActionGroupEmail" : {
        "type" : "String",
        "metadata" : {
          "displayName" : "Action Group Email",
          "description" : "Email address to send alerts to"
        },
        "defaultValue" : var.action_group_email
      },
      "MonitorDisable" : {
        "type" : "String",
        "metadata" : {
          "displayName" : "Effect",
          "description" : "Tag name to disable monitoring  Subscription level alerts. Set to true if monitoring should be disabled"
        },
        "defaultValue" : "MonitorDisable"
      }
    }
  )
  depends_on = [
    azurerm_monitor_alert_processing_rule_action_group.alert_rule
  ]
}

resource "azurerm_policy_set_definition" "monitor" {
  name                = "${var.mg_identification}-srvc-defset"
  policy_type         = "Custom"
  display_name        = "${upper(var.mg_identification)} - ${var.monitoring_def_set_display_name}"
  management_group_id = data.azurerm_management_group.ccc.id
  metadata = jsonencode(
    {
      "category" : "Monitoring"
    }
  )
  dynamic "policy_definition_reference" {
    for_each = local.alerts
    content {
      policy_definition_id = module.service_alert_def[policy_definition_reference.key].output_definition_id
      parameter_values     = jsonencode({})
    }
  }
  depends_on = [
    module.service_alert_def
  ]
}

module "monitor_policy_assign" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-monitor-policy"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.monitoring_assignment_display_name}"
  policy_assignment_location     = var.location
  definition_id                  = azurerm_policy_set_definition.monitor.id
  mg_id                          = data.azurerm_management_group.ccc.id
}

module "monitor_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.monitor_policy_assign.output_principle_id
}

# Grafana

resource "azurerm_resource_provider_registration" "monitor_registration" {
  name = "Microsoft.Monitor"
}

resource "azurerm_resource_provider_registration" "dashboard_registration" {
  name = "Microsoft.Dashboard"
}

resource "azurerm_dashboard_grafana" "grafana" {
  name                  = "${var.mg_identification}-${var.grafana_name}"
  resource_group_name   = azurerm_resource_group.mgmt_rg.name
  location              = azurerm_resource_group.mgmt_rg.location
  api_key_enabled       = true
  grafana_major_version = 10

  identity {
    type = "SystemAssigned"
  }

  tags = merge(
    {
      Type = "Grafana Instance"
    },
    var.default_tags
  )

  depends_on = [
    azurerm_resource_provider_registration.dashboard_registration,
    azurerm_resource_provider_registration.monitor_registration
  ]
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}