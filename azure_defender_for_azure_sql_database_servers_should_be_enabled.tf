module "azure_defender_for_azure_sql_database_servers_should_be_enabled_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}Azure Defender for Azure SQL Database servers should be enabled"
  policy_definition_display_name = "${var.org_prefix}Azure Defender for SQL provides functionality for surfacing and mitigating potential database vulnerabilities, detecting anomalous activities that could indicate threats to SQL databases, and discovering and classifying sensitive data"
  policy_definition_description  = "Azure Security Center analyzes the traffic patterns of Internet facing virtual machines and provides Network Security Group rule recommendations that reduce the potential attack surface"
  policy_definition_metadata = jsonencode(
    {
      "category" : "Security Center"
    }
  )
  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "Microsoft.Compute/virtualMachines"
      },
      "then" : {
        "effect" : "${var.azure_defender_for_azure_sql_database_servers_should_be_enabled_policy_effect}",
        "details" : {
          "type" : "Microsoft.Security/assessments",
          "name" : "f9f0eed0-f143-47bf-b856-671ea2eeed62",
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