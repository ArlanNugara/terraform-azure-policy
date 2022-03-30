module "ssl_storage_secure_transfer_setting_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.ssl_storage_secure_transfer_setting_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.ssl_storage_secure_transfer_setting_policy_display_name}"
  policy_definition_description  = var.ssl_storage_secure_transfer_setting_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.ssl_storage_secure_transfer_setting_policy_category}"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.Storage/storageAccounts"
          },
          {
            "anyOf" : [
              {
                "allOf" : [
                  {
                    "value" : "[requestContext().apiVersion]",
                    "less" : "2019-04-01"
                  },
                  {
                    "field" : "Microsoft.Storage/storageAccounts/supportsHttpsTrafficOnly",
                    "exists" : "false"
                  }
                ]
              },
              {
                "field" : "Microsoft.Storage/storageAccounts/supportsHttpsTrafficOnly",
                "equals" : "false"
              }
            ]
          }
        ]
      },
      "then" : {
        "effect" : "${var.ssl_storage_secure_transfer_setting_policy_effect}"
      }
    }
  )
}