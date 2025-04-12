// VM Change Tracking Extensions for ARC VM

module "vm_change_tracking_arc_assign" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-change-inventory-arc"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.vm_change_tracking_policy_display_name} for Azure ARC"
  policy_assignment_location     = var.location
  definition_id                  = "/providers/Microsoft.Authorization/policySetDefinitions/53448c70-089b-4f52-8f38-89196d7f2de1"
  mg_id                          = data.azurerm_management_group.ccc.id
  policy_assignment_param = jsonencode(
    {
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

module "vm_change_tracking_arc_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.vm_change_tracking_arc_assign.output_principle_id
}