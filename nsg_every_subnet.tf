module "nsg_every_subnet_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.nsg_every_subnet_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.nsg_every_subnet_policy_display_name}"
  policy_definition_description  = var.nsg_every_subnet_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.nsg_every_subnet_policy_category}"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "Microsoft.Network/virtualNetworks/subnets"
      },
      "then" : {
        "effect" : "${var.nsg_every_subnet_policy_effect}",
        "details" : {
          "type" : "Microsoft.Security/assessments",
          "name" : "eade5b56-eefd-444f-95c8-23f29e5d93cb",
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