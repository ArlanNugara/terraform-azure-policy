module "allowed_vm_extensions_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.allowed_vm_extensions_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.allowed_vm_extensions_policy_display_name}"
  policy_definition_description  = var.allowed_vm_extensions_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.allowed_vm_extensions_policy_category}"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.Compute/virtualMachines/extensions"
          },
          {
            "field" : "Microsoft.Compute/virtualMachines/extensions/type",
            "notIn" : "${var.allowed_vm_extensions}"
          }
        ]
      },
      "then" : {
        "effect" : "${var.allowed_vm_extensions_policy_effect}"
      }
    }
  )
}