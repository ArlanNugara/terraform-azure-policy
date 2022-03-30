module "vm_managed_disk_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.vm_managed_disk_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.vm_managed_disk_policy_display_name}"
  policy_definition_description  = var.vm_managed_disk_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.vm_managed_disk_policy_category}"
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
                "field" : "Microsoft.Compute/virtualMachines/osDisk.uri",
                "exists" : "True"
              }
            ]
          },
          {
            "allOf" : [
              {
                "field" : "type",
                "equals" : "Microsoft.Compute/VirtualMachineScaleSets"
              },
              {
                "anyOf" : [
                  {
                    "field" : "Microsoft.Compute/VirtualMachineScaleSets/osDisk.vhdContainers",
                    "exists" : "True"
                  },
                  {
                    "field" : "Microsoft.Compute/VirtualMachineScaleSets/osdisk.imageUrl",
                    "exists" : "True"
                  }
                ]
              }
            ]
          }
        ]
      },
      "then" : {
        "effect" : "${var.vm_managed_disk_policy_effect}"
      }
    }
  )
}