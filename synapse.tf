// Synapse Policy

resource "azurerm_policy_set_definition" "syn" {
  name                = "${var.mg_identification}-syn-pol-set"
  display_name        = "${upper(var.mg_identification)} - Synapse Governance Set"
  policy_type         = "Custom"
  management_group_id = data.azurerm_management_group.ccc.id
  metadata = jsonencode(
    {
      "category" : "Analytics"
    }
  )
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/f7d52b2d-e161-4dfa-a82b-55e564167385"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/cfaf0007-99c7-4b01-b36b-4048872ac978"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/cb3738a6-82a2-4a18-b87b-15217b9deff4"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/6ea81a52-5ca7-4575-9669-eaa910b7edf8"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/38d8df46-cf4e-4073-8e03-48c24b29de0d"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/3484ce98-c0c5-4c83-994b-c5ac24785218"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/2d9dbfa3-927b-4cf0-9d0f-08747f971650"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0049a6b3-a662-4f3e-8635-39cf44ace45a"
    parameter_values     = jsonencode({})
  }
}

module "syn_pol" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-syn-pol"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.syn_policy_display_name}"
  definition_id                  = azurerm_policy_set_definition.syn.id
  policy_assignment_location     = var.location
  mg_id                          = data.azurerm_management_group.ccc.id
}

module "syn_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.syn_pol.output_principle_id
}