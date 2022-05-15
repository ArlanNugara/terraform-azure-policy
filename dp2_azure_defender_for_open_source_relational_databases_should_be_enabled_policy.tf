module "dp2_azure_defender_for_open_source_relational_databases_should_be_enabled_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Azure Defender for open-source relational databases should be enabled"
  policy_definition_display_name = "${var.client}-Azure Defender for open-source relational databases should be enabled"
  policy_definition_description  = "Azure Defender for open-source relational databases detects anomalous activities indicating unusual and potentially harmful attempts to access or exploit databases. Learn more about the capabilities of Azure Defender for open-source relational databases at https://aka.ms/AzDforOpenSourceDBsDocu. Important: Enabling this plan will result in charges for protecting your open-source relational databases. Learn about the pricing on Security Center's pricing page: https://aka.ms/pricing-security-center"
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
          "name" : "OpenSourceRelationalDatabases",
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
