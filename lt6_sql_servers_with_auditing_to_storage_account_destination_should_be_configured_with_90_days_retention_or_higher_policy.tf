module "lt6_sql_servers_with_auditing_to_storage_account_destination_should_be_configured_with_90_days_retention_or_higher_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-SQL servers with auditing to storage account destination should be configured with 90 days retention or higher"
  policy_definition_display_name = "${var.client}-SQL servers with auditing to storage account destination should be configured with 90 days retention or higher"
  policy_definition_description  = "For incident investigation purposes, we recommend setting the data retention for your SQL Server' auditing to storage account destination to at least 90 days. Confirm that you are meeting the necessary retention rules for the regions in which you are operating. This is sometimes required for compliance with regulatory standards."
  policy_definition_metadata = jsonencode(
    {
      "category" : "SQL"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.Sql/servers"
          },
          {
            "field" : "kind",
            "notContains" : "analytics"
          }
        ]
      },
      "then" : {
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.Sql/servers/auditingSettings",
          "name" : "default",
          "existenceCondition" : {
            "anyOf" : [
              {
                "allOf" : [
                  {
                    "field" : "Microsoft.Sql/servers/auditingSettings/isAzureMonitorTargetEnabled",
                    "equals" : true
                  },
                  {
                    "field" : "Microsoft.Sql/servers/auditingSettings/storageEndpoint",
                    "equals" : ""
                  }
                ]
              },
              {
                "field" : "Microsoft.Sql/servers/auditingSettings/retentionDays",
                "equals" : 0
              },
              {
                "field" : "Microsoft.Sql/servers/auditingSettings/retentionDays",
                "greaterOrEquals" : 90
              }
            ]
          }
        }
      }
    }
  )
}
