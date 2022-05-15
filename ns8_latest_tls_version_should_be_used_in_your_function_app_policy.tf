module "ns8_latest_tls_version_should_be_used_in_your_function_app_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Latest TLS version should be used in your Function App"
  policy_definition_display_name = "${var.client}-Latest TLS version should be used in your Function App"
  policy_definition_description  = "Upgrade to the latest TLS version"
  policy_definition_metadata = jsonencode(
    {
      "category" : "App Service"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.Web/sites"
          },
          {
            "field" : "kind",
            "like" : "functionapp*"
          }
        ]
      },
      "then" : {
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.Web/sites/config",
          "name" : "web",
          "existenceCondition" : {
            "field" : "Microsoft.Web/sites/config/minTlsVersion",
            "equals" : "1.2"
          }
        }
      }
    }
  )
}
