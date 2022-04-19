module "pa4_deprecated_accounts_should_be_removed_from_your_subscription_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Deprecated accounts should be removed from your subscription"
  policy_definition_display_name = "${var.client}-Deprecated accounts should be removed from your subscription"
  policy_definition_description  = "Deprecated accounts should be removed from your subscriptions.  Deprecated accounts are accounts that have been blocked from signing in."
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
          "name" : "00c6d40b-e990-6acf-d4f3-471e747a27c4",
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
