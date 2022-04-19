module "dp2_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Azure Defender for SQL should be enabled for unprotected SQL Managed Instances"
  policy_definition_display_name = "${var.client}-Azure Defender for SQL should be enabled for unprotected SQL Managed Instances"
  policy_definition_description  = "Audit each SQL Managed Instance without advanced data security."
  policy_definition_metadata = jsonencode(
    {
      "category" : "SQL"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "Microsoft.Sql/managedInstances"
      },
      "then" : {
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.Sql/managedInstances/securityAlertPolicies",
          "name" : "Default",
          "existenceCondition" : {
            "field" : "Microsoft.Sql/managedInstances/securityAlertPolicies/state",
            "equals" : "Enabled"
          }
        }
      }
    }
  )
}
