module "pv2_cors_should_not_allow_every_resource_to_access_your_api_app_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-CORS should not allow every resource to access your API App"
  policy_definition_display_name = "${var.client}-CORS should not allow every resource to access your API App"
  policy_definition_description  = "Cross-Origin Resource Sharing (CORS) should not allow all domains to access your API app. Allow only required domains to interact with your API app."
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
            "like" : "*api"
          }
        ]
      },
      "then" : {
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.Web/sites/config",
          "existenceCondition" : {
            "field" : "Microsoft.Web/sites/config/web.cors.allowedOrigins[*]",
            "notEquals" : "*"
          }
        }
      }
    }
  )
}
