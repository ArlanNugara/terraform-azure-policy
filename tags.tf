// Tags Policy

module "tags_required" {
  for_each                = var.required_tags
  source                  = "./modules/policy/definition"
  definition_name         = "${lower(var.mg_identification)}-req-tag-${each.value}"
  definition_display_name = "${upper(var.mg_identification)} - Required Tags - ${each.value}"
  mg_id                   = data.azurerm_management_group.ccc.id
  definition_mode         = "All"
  definition_metadata = jsonencode(
    {
      "category" : "Tags"
    }
  )
  definition_parameters = jsonencode(
    {
      "requiredTagName" : {
        "type" : "String",
        "metadata" : {
          "displayName" : "Tag Name",
          "description" : "Name of the tag, such as 'environment'"
        }
      },
      "effect" : {
        "type" : "String",
        "metadata" : {
          "displayName" : "Policy Effect",
          "description" : "The desired effect of the policy."
        },
        "allowedValues" : [
          "audit",
          "Audit",
          "deny",
          "Deny"
        ]
      }
    }
  )
  definition_policy_rule = jsonencode(
    {
      "if" : {
        "field" : "[concat('tags[', parameters('requiredTagName'), ']')]",
        "exists" : "false"
      },
      "then" : {
        "effect" : "[parameters('effect')]"
      }
    }
  )
}

module "tags_optional" {
  for_each                = var.optional_tags
  source                  = "./modules/policy/definition"
  definition_name         = "${lower(var.mg_identification)}-opt-tag-${each.value}"
  definition_display_name = "${upper(var.mg_identification)} - Optional Tags - ${each.value}"
  mg_id                   = data.azurerm_management_group.ccc.id
  definition_mode         = "All"
  definition_metadata = jsonencode(
    {
      "category" : "Tags"
    }
  )
  definition_parameters = jsonencode(
    {
      "optionalTagName" : {
        "type" : "String",
        "metadata" : {
          "displayName" : "Tag Name",
          "description" : "Name of the tag, such as 'environment'"
        }
      },
      "effect" : {
        "type" : "String",
        "metadata" : {
          "displayName" : "Policy Effect",
          "description" : "The desired effect of the policy."
        },
        "allowedValues" : [
          "audit",
          "Audit",
          "deny",
          "Deny"
        ]
      }
    }
  )
  definition_policy_rule = jsonencode(
    {
      "if" : {
        "field" : "[concat('tags[', parameters('optionalTagName'), ']')]",
        "exists" : "false"
      },
      "then" : {
        "effect" : "[parameters('effect')]"
      }
    }
  )
}

resource "azurerm_policy_set_definition" "req_tags" {
  name                = "${var.mg_identification}-req-tags-set"
  display_name        = "${upper(var.mg_identification)} - Required Tags Governance Set"
  policy_type         = "Custom"
  management_group_id = data.azurerm_management_group.ccc.id
  metadata = jsonencode(
    {
      "category" : "Tags"
    }
  )
  dynamic "policy_definition_reference" {
    for_each = toset(var.required_tags)
    content {
      policy_definition_id = module.tags_required[policy_definition_reference.value].output_definition_id
      parameter_values = jsonencode(
        {
          "requiredTagName" : {
            "value" : policy_definition_reference.value
          },
          "effect" : {
            "value" : var.req_tags_effect
          }
        }
      )
    }
  }
}

resource "azurerm_policy_set_definition" "opt_tags" {
  name                = "${var.mg_identification}-opt-tags-set"
  display_name        = "${upper(var.mg_identification)} - Optional Tags Governance Set"
  policy_type         = "Custom"
  management_group_id = data.azurerm_management_group.ccc.id
  metadata = jsonencode(
    {
      "category" : "Tags"
    }
  )
  dynamic "policy_definition_reference" {
    for_each = toset(var.optional_tags)
    content {
      policy_definition_id = module.tags_optional[policy_definition_reference.value].output_definition_id
      parameter_values = jsonencode(
        {
          "optionalTagName" : {
            "value" : policy_definition_reference.key
          },
          "effect" : {
            "value" : var.opt_tags_effect
          }
        }
      )
    }
  }
}

module "req_tags_pol" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-req-tags"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.req_tags_policy_display_name}"
  definition_id                  = azurerm_policy_set_definition.req_tags.id
  policy_assignment_location     = var.location
  mg_id                          = data.azurerm_management_group.ccc.id
}

module "opt_tags_pol" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-opt-tags"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.opt_tags_policy_display_name}"
  definition_id                  = azurerm_policy_set_definition.opt_tags.id
  policy_assignment_location     = var.location
  mg_id                          = data.azurerm_management_group.ccc.id
}

module "req-tags_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.req_tags_pol.output_principle_id
}

module "opt_tags_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.opt_tags_pol.output_principle_id
}