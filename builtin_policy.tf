// Assign Built-In Policy

module "builtin_policy" {
  source                         = "./modules/policy/assignment"
  for_each                       = local.builtin-policy
  policy_assignment_name         = lower("${var.mg_identification}-builtin-${each.key}")
  policy_assignment_display_name = each.value.display_name
  definition_id                  = each.value.definition
  mg_id                          = data.azurerm_management_group.ccc.id
  policy_assignment_location     = var.location
}

module "builtin_policy_rbac" {
  source                       = "./modules/rbac"
  for_each                     = local.builtin-policy
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = each.value.rbac_def
  rbac_assignment_principle_id = module.builtin_policy[each.key].output_principle_id
}