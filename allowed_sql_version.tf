module "allowed_sql_version_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.allowed_sql_version_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.allowed_sql_version_policy_display_name}"
  policy_definition_description  = var.allowed_sql_version_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.allowed_sql_version_policy_category}"
    }
  )
  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.SQL/servers"
          },
          {
            "not" : {
              "field" : "Microsoft.SQL/servers/version",
              "equals" : "${jsonencode(var.allowed_sql_version)}"
            }
          }
        ]
      },
      "then" : {
        "effect" : "${var.allowed_sql_version_policy_effect}"
      }
    }
  )
}