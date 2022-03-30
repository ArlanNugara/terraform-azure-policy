module "vm_internet_facing_nsg_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.vm_internet_facing_nsg_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.vm_internet_facing_nsg_policy_display_name}"
  policy_definition_description  = var.vm_internet_facing_nsg_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.vm_internet_facing_nsg_policy_category}"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "in" : [
          "Microsoft.Compute/virtualMachines",
          "Microsoft.ClassicCompute/virtualMachines"
        ]
      },
      "then" : {
        "effect" : "${var.vm_internet_facing_nsg_policy_effect}",
        "details" : {
          "type" : "Microsoft.Security/assessments",
          "name" : "483f12ed-ae23-447e-a2de-a67a10db4353",
          "existenceCondition" : {
            "field" : "Microsoft.Security/assessments/status.code",
            "in" : [
              "NotApplicable",
              "Healthy"
            ]
          }
        }
      }
    }
  )
}