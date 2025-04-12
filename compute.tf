// Compute Policy

module "comp_allowed_os" {
  source                  = "./modules/policy/definition"
  definition_name         = "${lower(var.mg_identification)}-comp-vm-os"
  definition_display_name = "${upper(var.mg_identification)} - Allowed VM OS versions"
  mg_id                   = data.azurerm_management_group.ccc.id
  definition_mode         = "All"
  definition_metadata = jsonencode(
    {
      "category" : "Compute"
    }
  )

  definition_parameters = jsonencode(
    {
      "windows_os_version" : {
        "type" : "Array",
        "metadata" : {
          "displayName" : "Allowed OS Version for Windows",
          "description" : "List of OS Version allowed for Windows"
        }
      },
      "linux_os_version" : {
        "type" : "Array",
        "metadata" : {
          "displayName" : "Allowed OS Version for Linux",
          "description" : "List of OS Version allowed for Linux"
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
        "allOf" : [
          {
            "field" : "type",
            "in" : [
              "Microsoft.Compute/virtualMachines",
              "Microsoft.Compute/VirtualMachineScaleSets"
            ]
          },
          {
            "allOf" : [
              {
                "not" : {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/licenseType",
                      "notEquals" : "Windows_Server"
                    },
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "in" : [
                        "MicrosoftWindowsServer",
                        "Invatron"
                      ]
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "in" : [
                        "WindowsServer",
                        "Periscope"
                      ]
                    },
                    {
                      "field" : "Microsoft.Compute/imageSku",
                      "in" : "[parameters('windows_os_version')]"
                    }
                  ]
                }
              },
              {
                "not" : {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "in" : [
                        "RedHat",
                        "Canonical"
                      ]
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "in" : [
                        "RHEL",
                        "Canonical"
                      ]
                    },
                    {
                      "field" : "Microsoft.Compute/imageSku",
                      "in" : "[parameters('linux_os_version')]"
                    }
                  ]
                }
              }
            ]
          }
        ]
      },
      "then" : {
        "effect" : "[parameters('effect')]"
      }
    }
  )
}

module "comp_allowed_sku" {
  source                  = "./modules/policy/definition"
  definition_name         = "${lower(var.mg_identification)}-comp-vm-sku"
  definition_display_name = "${upper(var.mg_identification)} - Allowed VM SKU"
  mg_id                   = data.azurerm_management_group.ccc.id
  definition_mode         = "All"
  definition_metadata = jsonencode(
    {
      "category" : "Compute"
    }
  )

  definition_parameters = jsonencode(
    {
      "listOfAllowedSKUs" : {
        "type" : "Array",
        "metadata" : {
          "description" : "The list of size SKUs that can be specified for virtual machines.",
          "displayName" : "Allowed Size SKUs",
          "strongType" : "VMSKUs"
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
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.Compute/virtualMachines"
          },
          {
            "not" : {
              "field" : "Microsoft.Compute/virtualMachines/sku.name",
              "in" : "[parameters('listOfAllowedSKUs')]"
            }
          }
        ]
      },
      "then" : {
        "effect" : "[parameters('effect')]"
      }
    }
  )
}

resource "azurerm_policy_set_definition" "comp" {
  name                = "${var.mg_identification}-comp-pol-set"
  display_name        = "${upper(var.mg_identification)} - Compute Governance Set"
  management_group_id = data.azurerm_management_group.ccc.id
  policy_type         = "Custom"
  policy_definition_reference {
    policy_definition_id = module.comp_allowed_os.output_definition_id
    parameter_values = jsonencode(
      {
        "windows_os_version" : {
          "type" : "Array",
          "metadata" : {
            "displayName" : "Allowed OS Version for Windows",
            "description" : "List of OS Version allowed for Windows"
          },
          "value" : var.win_os_version
        },
        "linux_os_version" : {
          "type" : "Array",
          "metadata" : {
            "displayName" : "Allowed OS Version for Linux",
            "description" : "List of OS Version allowed for Linux"
          },
          "value" : var.lnx_os_version
        },
        "effect" : {
          "type" : "String",
          "metadata" : {
            "displayName" : "Policy Effect",
            "description" : "The desired effect of the policy."
          },
          "value" : var.comp_allowed_os_effect
        }
      }
    )
  }
  policy_definition_reference {
    policy_definition_id = module.comp_allowed_sku.output_definition_id
    parameter_values = jsonencode(
      {
        "listOfAllowedSKUs" : {
          "type" : "Array",
          "metadata" : {
            "description" : "The list of size SKUs that can be specified for virtual machines.",
            "displayName" : "Allowed Size SKUs",
            "strongType" : "VMSKUs"
          },
          "value" : var.comp_allowed_sku
        },
        "effect" : {
          "type" : "String",
          "metadata" : {
            "displayName" : "Policy Effect",
            "description" : "The desired effect of the policy."
          },
          "value" : var.comp_allowed_sku_effect
        }
      }
    )
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/c0e996f8-39cf-4af9-9f45-83fbde810432"
    parameter_values = jsonencode(
      {
        "approvedExtensions" : {
          "type" : "Array",
          "metadata" : {
            "description" : "The list of approved extension types that can be installed.",
            "displayName" : "Approved extensions"
          },
          "value" : var.comp_allowed_extensions
        }
      }
    )
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0015ea4d-51ff-4ce3-8d8c-f3f8f0179a56"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/06a78e20-9358-41c9-923c-fb736d382a4d"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/fc4d8e41-e223-45ea-9bf5-eada37891d87"
    parameter_values     = jsonencode({})
  }
}

module "comp_pol" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-comp-pol"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.comp_policy_display_name}"
  policy_assignment_location     = var.location
  definition_id                  = azurerm_policy_set_definition.comp.id
  mg_id                          = data.azurerm_management_group.ccc.id
}

module "comp_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.comp_pol.output_principle_id
}