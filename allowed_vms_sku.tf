module "allowed_vms_sku_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.allowed_vm_sku_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.allowed_vm_sku_policy_display_name}"
  policy_definition_description  = var.allowed_vm_sku_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.allowed_vm_sku_policy_category}"
    }
  )

  policy_definition_rule = jsonencode(
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
              "in" : "${var.allowed_vms_sku}"
            }
          }
        ]
      },
      "then" : {
        "effect" : "${var.allowed_vm_sku_policy_effect}"
      }
    }
  )
}
