module "dp2_azure_defender_for_azure_sql_database_servers_should_be_enabled_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Azure Defender for Azure SQL Database servers should be enabled"
  policy_definition_display_name = "${var.client}-Azure Defender for Azure SQL Database servers should be enabled"
  policy_definition_description  = "Azure Defender for SQL provides functionality for surfacing and mitigating potential database vulnerabilities, detecting anomalous activities that could indicate threats to SQL databases, and discovering and classifying sensitive data."
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
          "name" : "SqlServers",
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
