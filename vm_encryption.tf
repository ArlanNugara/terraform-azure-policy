module "vm_encryption_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.vm_encryption_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.vm_encryption_policy_display_name}"
  policy_definition_description  = var.vm_encryption_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.vm_encryption_policy_category}"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "anyOf" : [
          {
            "allOf" : [
              {
                "field" : "type",
                "equals" : "Microsoft.Compute/virtualMachines"
              },
              {
                "field" : "Microsoft.Compute/virtualMachines/securityProfile.encryptionAtHost",
                "notEquals" : "true"
              }
            ]
          },
          {
            "allOf" : [
              {
                "field" : "type",
                "equals" : "Microsoft.Compute/virtualMachineScaleSets"
              },
              {
                "field" : "Microsoft.Compute/virtualMachineScaleSets/virtualMachineProfile.securityProfile.encryptionAtHost",
                "notEquals" : "true"
              }
            ]
          }
        ]
      },
      "then" : {
        "effect" : "${var.vm_encryption_policy_effect}"
      }
    }
  )
}