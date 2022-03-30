module "vm_ip_forwarding_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.vm_ip_forwarding_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.vm_ip_forwarding_policy_display_name}"
  policy_definition_description  = var.vm_ip_forwarding_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.vm_ip_forwarding_policy_category}"
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
        "effect" : "${var.vm_ip_forwarding_policy_effect}",
        "details" : {
          "type" : "Microsoft.Security/assessments",
          "name" : "c3b51c94-588b-426b-a892-24696f9e54cc",
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