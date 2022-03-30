module "sql_database_tls_version_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.sql_database_tls_version_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.sql_database_tls_version_policy_display_name}"
  policy_definition_description  = var.sql_database_tls_version_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.sql_database_tls_version_policy_category}"
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
            "anyOf" : [
              {
                "field" : "Microsoft.Sql/servers/minimalTlsVersion",
                "exists" : false
              },
              {
                "field" : "Microsoft.Sql/servers/minimalTlsVersion",
                "notEquals" : "${var.sql_database_allowed_tls_version}"
              }
            ]
          }
        ]
      },
      "then" : {
        "effect" : "${var.sql_database_tls_version_policy_effect}"
      }
    }
  )
}