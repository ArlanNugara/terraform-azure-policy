module "lt3_resource_logs_in_search_services_should_be_enabled_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Resource logs in Search services should be enabled"
  policy_definition_display_name = "${var.client}-Resource logs in Search services should be enabled"
  policy_definition_description  = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised"
  policy_definition_metadata = jsonencode(
    {
      "category" : "Search"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "Microsoft.Search/searchServices"
      },
      "then" : {
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.Insights/diagnosticSettings",
          "existenceCondition" : {
            "count" : {
              "field" : "Microsoft.Insights/diagnosticSettings/logs[*]",
              "where" : {
                "anyOf" : [
                  {
                    "allOf" : [
                      {
                        "field" : "Microsoft.Insights/diagnosticSettings/logs[*].retentionPolicy.enabled",
                        "equals" : "true"
                      },
                      {
                        "anyOf" : [
                          {
                            "field" : "Microsoft.Insights/diagnosticSettings/logs[*].retentionPolicy.days",
                            "equals" : "0"
                          },
                          {
                            "value" : "[padLeft(current('Microsoft.Insights/diagnosticSettings/logs[*].retentionPolicy.days'), 3, '0')]",
                            "greaterOrEquals" : "[padLeft(parameters('requiredRetentionDays'), 3, '0')]"
                          }
                        ]
                      },
                      {
                        "field" : "Microsoft.Insights/diagnosticSettings/logs.enabled",
                        "equals" : "true"
                      }
                    ]
                  },
                  {
                    "allOf" : [
                      {
                        "field" : "Microsoft.Insights/diagnosticSettings/logs.enabled",
                        "equals" : "true"
                      },
                      {
                        "anyOf" : [
                          {
                            "field" : "Microsoft.Insights/diagnosticSettings/logs[*].retentionPolicy.enabled",
                            "notEquals" : "true"
                          },
                          {
                            "field" : "Microsoft.Insights/diagnosticSettings/storageAccountId",
                            "exists" : false
                          }
                        ]
                      }
                    ]
                  }
                ]
              }
            },
            "greaterOrEquals" : 1
          }
        }
      }
    }
  )
}
