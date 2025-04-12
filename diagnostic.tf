// Diagnostics

# Enable Activity Logs

# resource "azurerm_monitor_diagnostic_setting" "activity_log" {
#   name                       = var.activity_log_diag_name
#   target_resource_id         = data.azurerm_subscription.this.id
#   log_analytics_workspace_id = module.law.output_law_id
#   enabled_log {
#     category = "Administrative"
#   }
#   enabled_log {
#     category = "Security"
#   }
#   enabled_log {
#     category = "ServiceHealth"
#   }
#   enabled_log {
#     category = "Alert"
#   }
#   enabled_log {
#     category = "Recommendation"
#   }
#   enabled_log {
#     category = "Policy"
#   }
#   enabled_log {
#     category = "Autoscale"
#   }
#   enabled_log {
#     category = "ResourceHealth"
#   }
# }

# Enable Resource Logs

module "all_logs_category" {
  source                  = "./modules/policy/definition"
  for_each                = local.alllog_def
  definition_name         = "${var.mg_identification}-${each.key}"
  definition_display_name = "${upper(var.mg_identification)} - ${each.value.display_name}"
  definition_mode         = "Indexed"
  mg_id                   = data.azurerm_management_group.ccc.id
  definition_policy_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : each.value.resource_type
          },
          {
            "anyOf" : [
              {
                "value" : "[first(parameters('resourceLocationList'))]",
                "equals" : "*"
              },
              {
                "field" : "location",
                "in" : "[parameters('resourceLocationList')]"
              }
            ]
          }
        ]
      },
      "then" : {
        "effect" : "[parameters('effect')]",
        "details" : {
          "type" : "Microsoft.Insights/diagnosticSettings",
          "evaluationDelay" : "AfterProvisioning",
          "existenceCondition" : {
            "allOf" : [
              {
                "count" : {
                  "field" : "Microsoft.Insights/diagnosticSettings/logs[*]",
                  "where" : {
                    "allOf" : [
                      {
                        "field" : "Microsoft.Insights/diagnosticSettings/logs[*].enabled",
                        "equals" : "[equals(parameters('categoryGroup'), 'allLogs')]"
                      },
                      {
                        "field" : "microsoft.insights/diagnosticSettings/logs[*].categoryGroup",
                        "equals" : "allLogs"
                      }
                    ]
                  }
                },
                "equals" : 1
              },
              {
                "field" : "Microsoft.Insights/diagnosticSettings/workspaceId",
                "equals" : "[parameters('logAnalytics')]"
              }
            ]
          },
          "roleDefinitionIds" : [
            "/providers/Microsoft.Authorization/roleDefinitions/92aaf0da-9dab-42b6-94a3-d43ce8d16293",
            "/providers/microsoft.authorization/roleDefinitions/749f88d5-cbae-40b8-bcfc-e573ddc772fa",
            "/providers/Microsoft.Authorization/roleDefinitions/18d7d88d-d35e-4fb5-a5c3-7773c20a72d9"
          ],
          "deployment" : {
            "properties" : {
              "mode" : "incremental",
              "template" : {
                "$schema" : "http ://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
                "contentVersion" : "1.0.0.0",
                "parameters" : {
                  "diagnosticSettingName" : {
                    "type" : "string"
                  },
                  "logAnalytics" : {
                    "type" : "string"
                  },
                  "categoryGroup" : {
                    "type" : "String"
                  },
                  "resourceName" : {
                    "type" : "string"
                  }
                },
                "variables" : {},
                "resources" : [
                  {
                    "type" : "${each.value.resource_type}/providers/diagnosticSettings",
                    "apiVersion" : "2021-05-01-preview",
                    "name" : "[concat(parameters('resourceName'), '/', 'Microsoft.Insights/', parameters('diagnosticSettingName'))]",
                    "dependsOn" : [],
                    "properties" : {
                      "workspaceId" : "[parameters('logAnalytics')]",
                      "metrics" : [],
                      "logs" : [
                        {
                          "categoryGroup" : "allLogs",
                          "enabled" : "[equals(parameters('categoryGroup'), 'allLogs')]"
                        }
                      ]
                    }
                  }
                ]
              },
              "parameters" : {
                "diagnosticSettingName" : {
                  "value" : "[parameters('diagnosticSettingName')]"
                },
                "logAnalytics" : {
                  "value" : "[parameters('logAnalytics')]"
                },
                "categoryGroup" : {
                  "value" : "[parameters('categoryGroup')]"
                },
                "resourceName" : {
                  "value" : "[field('name')]"
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
      "effect" : {
        "type" : "String",
        "metadata" : {
          "displayName" : "Effect",
          "description" : "Enable or disable the execution of the policy"
        },
        "allowedValues" : [
          "DeployIfNotExists",
          "AuditIfNotExists",
          "Disabled"
        ],
        "defaultValue" : "DeployIfNotExists"
      },
      "diagnosticSettingName" : {
        "type" : "String",
        "metadata" : {
          "displayName" : "Diagnostic Setting Name",
          "description" : "Diagnostic Setting Name"
        },
        "defaultValue" : "setByCustomPolicy-LogAnalytics"
      },
      "categoryGroup" : {
        "type" : "String",
        "metadata" : {
          "displayName" : "Category Group",
          "description" : "Diagnostic category group - none, audit, or allLogs."
        },
        "allowedValues" : [
          "audit",
          "allLogs"
        ],
        "defaultValue" : "allLogs"
      },
      "resourceLocationList" : {
        "type" : "Array",
        "metadata" : {
          "displayName" : "Resource Location List",
          "description" : "Resource Location List to send logs to nearby Log Analytics. A single entry \"*\" selects all locations (default)."
        },
        "defaultValue" : [
          "*"
        ]
      },
      "logAnalytics" : {
        "type" : "String",
        "metadata" : {
          "displayName" : "Log Analytics Workspace",
          "description" : "Log Analytics Workspace",
          "strongType" : "omsWorkspace",
          "assignPermissions" : true
        }
      }
    }
  )
  definition_metadata = jsonencode(
    {
      "category" : "Diagnostics"
    }
  )
}

resource "azurerm_policy_set_definition" "diag" {
  name                = "${var.mg_identification}-diag-policy-set"
  policy_type         = "Custom"
  display_name        = "${upper(var.mg_identification)} - ${var.alllogs_diag_policy_set_def_display_name}"
  management_group_id = data.azurerm_management_group.ccc.id
  metadata = jsonencode(
    {
      "category" : "Diagnostics"
    }
  )
  dynamic "policy_definition_reference" {
    for_each = local.alllog_def
    content {
      policy_definition_id = module.all_logs_category[policy_definition_reference.key].output_definition_id
      parameter_values = jsonencode(
        {
          "logAnalytics" : {
            "type" : "String",
            "metadata" : {
              "displayName" : "Log Analytics Workspace",
              "description" : "Log Analytics Workspace",
              "strongType" : "omsWorkspace",
            },
            "value" : module.law.output_law_id
          }
        }
      )
    }
  }
  lifecycle {
    ignore_changes = [
      policy_definition_reference
    ]
  }
  depends_on = [
    module.all_logs_category
  ]
}

module "diag_policy_assign" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-diag-policy-la"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.alllogs_diag_policy_assignment_display_name}"
  policy_assignment_location     = var.location
  definition_id                  = azurerm_policy_set_definition.diag.id
  mg_id                          = data.azurerm_management_group.ccc.id
}

module "diag_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.diag_policy_assign.output_principle_id
}

# resource "azurerm_management_group_policy_remediation" "policy_remediation" {
#   for_each                       = local.alllog_def
#   name                           = "${lower(var.mg_identification)}-${each.key}-rem"
#   management_group_id            = data.azurerm_management_group.ccc.id
#   policy_assignment_id           = module.diag_policy_assign.output_policy_assignment_id
#   policy_definition_reference_id = module.all_logs_category[each.key].output_definition_id
#   depends_on = [
#     module.diag_rbac
#   ]
#   lifecycle {
#     ignore_changes = [
#       policy_definition_reference_id
#     ]
#   }
# }

# Enable Storage Account Diagnostics

resource "azurerm_policy_set_definition" "sa_diag" {
  name                = "${var.mg_identification}-sa-diag-defset-la"
  display_name        = "${upper(var.mg_identification)} - ${var.sa_def_set_display_name}"
  policy_type         = "Custom"
  management_group_id = data.azurerm_management_group.ccc.id
  metadata = jsonencode(
    {
      "category" : "Diagnostics"
    }
  )
  dynamic "policy_definition_reference" {
    for_each = local.sa_diag.def_ids
    content {
      policy_definition_id = policy_definition_reference.value.id
      parameter_values     = local.sa_diag.def_set_param
    }
  }
  lifecycle {
    ignore_changes = [
      policy_definition_reference
    ]
  }
}

module "sa_diag_policy_assign" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-sa-diag-policy-la"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.sa_diag_assignment_display_name}"
  policy_assignment_location     = var.location
  definition_id                  = azurerm_policy_set_definition.sa_diag.id
  mg_id                          = data.azurerm_management_group.ccc.id
}

module "sa_diag_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.sa_diag_policy_assign.output_principle_id
}

# resource "azurerm_management_group_policy_remediation" "sa_policy_remediation" {
#   for_each                       = local.sa_diag.def_ids
#   name                           = "${lower(var.mg_identification)}-${each.key}-rem"
#   management_group_id            = data.azurerm_management_group.ccc.id
#   policy_assignment_id           = module.sa_diag_policy_assign.output_policy_assignment_id
#   policy_definition_reference_id = each.value.id
#   depends_on = [
#     module.sa_diag_rbac
#   ]
#   lifecycle {
#     ignore_changes = [
#       policy_definition_reference_id
#     ]
#   }
# }