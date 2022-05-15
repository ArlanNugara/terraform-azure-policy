module "im3_managed_identity_should_be_used_in_your_function_app_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Managed identity should be used in your Function App"
  policy_definition_display_name = "${var.client}-Managed identity should be used in your Function App"
  policy_definition_description  = "Use a managed identity for enhanced authentication security"
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
            "anyOf" : [
              {
                "field" : "Microsoft.Web/sites/config/managedServiceIdentityId",
                "exists" : "true"
              },
              {
                "field" : "Microsoft.Web/sites/config/xmanagedServiceIdentityId",
                "exists" : "true"
              }
            ]
          }
        }
      }
    }
  )
}
