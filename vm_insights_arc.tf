// VM Insights Extensions for ARC VM

module "win_vm_insight_policy_assign" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-win-vm-ama-arc"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.vm_insight_assignment_display_name} for Azure Windows ARC"
  policy_assignment_location     = var.location
  definition_id                  = "/providers/Microsoft.Authorization/policySetDefinitions/9575b8b7-78ab-4281-b53b-d3c1ace2260b"
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
      "scopeToSupportedImages" : {
        "type" : "Boolean",
        "metadata" : {
          "displayName" : "Scope Policy to Azure Monitor Agent-Supported Operating Systems",
          "description" : "If set to true, the policy will apply only to virtual machines with supported operating systems. Otherwise, the policy will apply to all virtual machine resources in the assignment scope. For supported operating systems, see https://aka.ms/AMAOverview."
        },
        "value" : false
      }
    }
  )
}

module "lnx_vm_insight_policy_assign" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-lnx-vm-ama-arc"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.vm_insight_assignment_display_name} for Azure Linux ARC"
  policy_assignment_location     = var.location
  definition_id                  = "/providers/Microsoft.Authorization/policySetDefinitions/118f04da-0375-44d1-84e3-0fd9e1849403"
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
      "scopeToSupportedImages" : {
        "type" : "Boolean",
        "metadata" : {
          "displayName" : "Scope Policy to Azure Monitor Agent-Supported Operating Systems",
          "description" : "If set to true, the policy will apply only to virtual machines with supported operating systems. Otherwise, the policy will apply to all virtual machine resources in the assignment scope. For supported operating systems, see https://aka.ms/AMAOverview."
        },
        "value" : false
      }
    }
  )
}

module "win_vm_insight_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.win_vm_insight_policy_assign.output_principle_id
}

module "lnx_vm_insight_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.lnx_vm_insight_policy_assign.output_principle_id
}