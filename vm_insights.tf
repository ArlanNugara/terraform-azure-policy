// VM Insights Extensions

resource "azurerm_monitor_data_collection_rule" "vm_insights_dcr" {
  name                        = "dcr-${var.mg_identification}-insights-001"
  resource_group_name         = azurerm_resource_group.mgmt_rg.name
  location                    = azurerm_resource_group.mgmt_rg.location
  data_collection_endpoint_id = azurerm_monitor_data_collection_endpoint.vm_dce.id

  destinations {
    log_analytics {
      workspace_resource_id = module.law.output_law_id
      name                  = "dcr-${var.mg_identification}-insights-001-log"
    }
  }

  data_flow {
    streams       = ["Microsoft-Perf"]
    destinations  = ["dcr-${var.mg_identification}-insights-001-log"]
    transform_kql = "source"
    output_stream = "Microsoft-Perf"
  }

  data_flow {
    streams       = ["Microsoft-Syslog"]
    destinations  = ["dcr-${var.mg_identification}-insights-001-log"]
    transform_kql = "source"
    output_stream = "Microsoft-Syslog"
  }

  data_flow {
    streams       = ["Microsoft-Event"]
    destinations  = ["dcr-${var.mg_identification}-insights-001-log"]
    transform_kql = "source"
    output_stream = "Microsoft-Event"
  }

  data_sources {
    performance_counter {
      name                          = "VMInsightsPerfCounters"
      streams                       = ["Microsoft-InsightsMetrics"]
      sampling_frequency_in_seconds = 60
      counter_specifiers            = ["\\VmInsights\\DetailedMetrics"]
    }

    windows_event_log {
      name    = "eventLogsDataSource"
      streams = ["Microsoft-Event"]
      x_path_queries = [
        "Application!*[System[(Level=1 or Level=2 or Level=3)]]",
        "Security!*[System[(band(Keywords,4503599627370496))]]",
        "System!*[System[(Level=1 or Level=2 or Level=3)]]"
      ]
    }

    syslog {
      name           = "sysLogsDataSource"
      streams        = ["Microsoft-Syslog"]
      facility_names = ["syslog"]
      log_levels = [
        "Critical",
        "Alert",
        "Emergency"
      ]
    }

    extension {
      name           = "DependencyAgentDataSource"
      extension_name = "DependencyAgent"
      streams        = ["Microsoft-ServiceMap"]
    }
  }
  # provider = azurerm.management
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

module "vm_insight_policy_assign" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-vm-insights"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.vm_insight_assignment_display_name}"
  policy_assignment_location     = var.location
  definition_id                  = "/providers/Microsoft.Authorization/policySetDefinitions/924bfe3a-762f-40e7-86dd-5c8b95eb09e6"
  mg_id                          = data.azurerm_management_group.ccc.id
  policy_assignment_param = jsonencode(
    {
      "dcrResourceId" : {
        "type" : "String",
        "metadata" : {
          "displayName" : "Data Collection Rule Resource Id or Data Collection Endpoint Resource Id",
          "description" : "Resource Id of the Data Collection Rule or the Data Collection Endpoint to be applied on the Linux machines in scope.",
          "portalReview" : "true"
        },
        "value" : azurerm_monitor_data_collection_rule.vm_insights_dcr.id
      },
      "bringYourOwnUserAssignedManagedIdentity" : {
        "type" : "Boolean",
        "metadata" : {
          "displayName" : "Bring Your Own User-Assigned Identity",
          "description" : "Enable this to use your pre-created user-assigned managed identity. The pre-created identity MUST exist within the subscription otherwise the policy deployment will fail. If enabled, ensure that the User-Assigned Identity Name and Identity Resource Group Name parameters match the pre-created identity. If not enabled, the policy will create per subscription, per resource user-assigned managed identities in a new resource group named 'Built-In-Identity-RG'."
        },
        "value" : false
      }
    }
  )
}

module "vm_insight_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.vm_insight_policy_assign.output_principle_id
}