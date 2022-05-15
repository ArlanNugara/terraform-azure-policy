module "dp3_ftps_only_should_be_required_in_your_function_app_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-FTPS only should be required in your Function App"
  policy_definition_display_name = "${var.client}-FTPS only should be required in your Function App"
  policy_definition_description  = "Enable FTPS enforcement for enhanced security"
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
            "field" : "Microsoft.Web/sites/config/ftpsState",
            "in" : [
              "FtpsOnly",
              "Disabled"
            ]
          }
        }
      }
    }
  )
}
