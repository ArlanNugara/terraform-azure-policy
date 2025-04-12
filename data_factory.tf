// Data Factory Policy

resource "azurerm_policy_set_definition" "adf" {
  name                = "${var.mg_identification}-adf-pol-set"
  display_name        = "${upper(var.mg_identification)} - Data Factory Governance Set"
  policy_type         = "Custom"
  management_group_id = data.azurerm_management_group.ccc.id
  metadata = jsonencode(
    {
      "category" : "Analytics"
    }
  )
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/77d40665-3120-4348-b539-3192ec808307"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4ec52d6d-beb7-40c4-9a9e-fe753254690e"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1cf164be-6819-4a50-b8fa-4bcaa4f98fb6"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/127ef6d7-242f-43b3-9eef-947faf1725d0"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/6809a3d0-d354-42fb-b955-783d207c62a8"
    parameter_values = jsonencode(
      {
        "allowedLinkedServiceResourceTypes" : {
          "type" : "Array",
          "metadata" : {
            "displayName" : "Allowed linked service resource types",
            "description" : "The list of allowed linked service resource types."
          },
          "value" : var.adf_linked_service_resource_type
        }
      }
    )
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/85bb39b5-2f66-49f8-9306-77da3ac5130f"
    parameter_values = jsonencode(
      {
        "maxCores" : {
          "type" : "Integer",
          "metadata" : {
            "displayName" : "Allowed max number of cores",
            "description" : "The max number of cores allowed for dataflow."
          },
          "value" : var.adf_max_cores
        }
      }
    )
  }
}

module "adf_pol" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-adf-pol"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.adf_policy_display_name}"
  definition_id                  = azurerm_policy_set_definition.adf.id
  policy_assignment_location     = var.location
  mg_id                          = data.azurerm_management_group.ccc.id
}

module "adf_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.adf_pol.output_principle_id
}