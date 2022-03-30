module "sql_database_private_endpoint_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.sql_database_private_endpoint_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.sql_database_private_endpoint_policy_display_name}"
  policy_definition_description  = var.sql_database_private_endpoint_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.sql_database_private_endpoint_policy_category}"
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
            "count" : {
              "field" : "Microsoft.Sql/servers/privateEndpointConnections[*]",
              "where" : {
                "field" : "Microsoft.Sql/servers/privateEndpointConnections[*].privateLinkServiceConnectionState.status",
                "equals" : "Approved"
              }
            },
            "less" : 1
          }
        ]
      },
      "then" : {
        "effect" : "${var.sql_database_private_endpoint_policy_effect}"
      }
    }
  )
}