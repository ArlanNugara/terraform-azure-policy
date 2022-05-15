module "dp4_transparent_data_encryption_on_sql_databases_should_be_enabled_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Transparent Data Encryption on SQL databases should be enabled"
  policy_definition_display_name = "${var.client}-Transparent Data Encryption on SQL databases should be enabled"
  policy_definition_description  = "Transparent data encryption should be enabled to protect data-at-rest and meet compliance requirements"
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
            "equals" : "Microsoft.Sql/servers/databases"
          },
          {
            "field" : "name",
            "notEquals" : "master"
          }
        ]
      },
      "then" : {
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.Sql/servers/databases/transparentDataEncryption",
          "name" : "current",
          "existenceCondition" : {
            "anyOf" : [
              {
                "field" : "Microsoft.Sql/transparentDataEncryption.status",
                "equals" : "enabled"
              },
              {
                "field" : "Microsoft.Sql/servers/databases/transparentDataEncryption/state",
                "equals" : "enabled"
              }
            ]
          }
        }
      }
    }
  )
}
