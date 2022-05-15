module "dp2_azure_defender_for_storage_should_be_enabled_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Azure Defender for Storage should be enabled"
  policy_definition_display_name = "${var.client}-Azure Defender for Storage should be enabled"
  policy_definition_description  = "Azure Defender for Storage provides detections of unusual and potentially harmful attempts to access or exploit storage accounts."
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
          "name" : "StorageAccounts",
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
