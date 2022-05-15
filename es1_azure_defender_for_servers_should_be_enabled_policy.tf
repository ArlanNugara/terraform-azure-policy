module "es1_azure_defender_for_servers_should_be_enabled_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Azure Defender for servers should be enabled"
  policy_definition_display_name = "${var.client}-Azure Defender for servers should be enabled"
  policy_definition_description  = "Azure Defender for servers provides real-time threat protection for server workloads and generates hardening recommendations as well as alerts about suspicious activities."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Security Center"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "Microsoft.Resources/subscriptions"
      },
      "then" : {
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.Security/pricings",
          "name" : "VirtualMachines",
          "existenceScope" : "subscription",
          "existenceCondition" : {
            "field" : "Microsoft.Security/pricings/pricingTier",
            "equals" : "Standard"
          }
        }
      }
    }
  )
}
