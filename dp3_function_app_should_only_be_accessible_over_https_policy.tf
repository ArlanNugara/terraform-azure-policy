module "dp3_function_app_should_only_be_accessible_over_https_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Function App should only be accessible over HTTPS"
  policy_definition_display_name = "${var.client}-Function App should only be accessible over HTTPS"
  policy_definition_description  = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
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
          },
          {
            "field" : "Microsoft.Web/sites/httpsOnly",
            "equals" : "false"
          }
        ]
      },
      "then" : {
        "effect" : "Audit"
      }
    }
  )
}
