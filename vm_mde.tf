// VM Microsoft Defender Extension

module "vm_mde_assign" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-mde"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.vm_mde_policy_display_name}"
  policy_assignment_location     = var.location
  definition_id                  = "/providers/Microsoft.Authorization/policySetDefinitions/e20d08c5-6d64-656d-6465-ce9e37fd0ebc"
  mg_id                          = data.azurerm_management_group.ccc.id
  policy_assignment_param        = jsonencode({})
}

module "vm_mde_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.vm_mde_assign.output_principle_id
}