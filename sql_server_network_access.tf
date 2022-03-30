module "sql_server_network_access_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.sql_server_network_access_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.sql_server_network_access_policy_display_name}"
  policy_definition_description  = var.sql_server_network_access_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.sql_server_network_access_policy_category}"
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
            "field" : "Microsoft.Sql/servers/publicNetworkAccess",
            "notEquals" : "Disabled"
          }
        ]
      },
      "then" : {
        "effect" : "${var.sql_server_network_access_policy_effect}"
      }
    }
  )
}