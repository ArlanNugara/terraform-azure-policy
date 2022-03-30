module "nsg_inbound_rules_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.nsg_inbound_rules_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.nsg_inbound_rules_policy_display_name}"
  policy_definition_description  = var.nsg_inbound_rules_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.nsg_inbound_rules_policy_category}"
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
        "effect" : "${var.nsg_inbound_rules_policy_effect}",
        "details" : {
          "type" : "Microsoft.Security/assessments",
          "name" : "3b20e985-f71f-483b-b078-f30d73936d43",
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