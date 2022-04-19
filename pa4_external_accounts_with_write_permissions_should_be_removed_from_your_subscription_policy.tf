module "pa4_external_accounts_with_write_permissions_should_be_removed_from_your_subscription_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-External accounts with write permissions should be removed from your subscription"
  policy_definition_display_name = "${var.client}-External accounts with write permissions should be removed from your subscription"
  policy_definition_description  = "External accounts with write privileges should be removed from your subscription in order to prevent unmonitored access."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Security Center"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "Microsoft.Resources/subscriptions"
      },
      "then" : {
        "effect" : "[parameters('effect')]",
        "details" : {
          "type" : "Microsoft.Security/assessments",
          "name" : "04e7147b-0deb-9796-2e5c-0336343ceb3d",
          "existenceCondition" : {
            "field" : "Microsoft.Security/assessments/status.code",
            "in" : [
              "NotApplicable",
              "Healthy"
            ]
          }
        }
      }
    }
  )
}
