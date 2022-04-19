module "pa4_external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-External accounts with owner permissions should be removed from your subscription"
  policy_definition_display_name = "${var.client}-External accounts with owner permissions should be removed from your subscription"
  policy_definition_description  = "External accounts with owner permissions should be removed from your subscription in order to prevent unmonitored access."
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
          "name" : "c3b6ae71-f1f0-31b4-e6c1-d5951285d03d",
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
