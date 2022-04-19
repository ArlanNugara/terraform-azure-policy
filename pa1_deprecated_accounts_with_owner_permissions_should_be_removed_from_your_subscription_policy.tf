module "pa1_deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Deprecated accounts with owner permissions should be removed from your subscription"
  policy_definition_display_name = "${var.client}-Deprecated accounts with owner permissions should be removed from your subscription"
  policy_definition_description  = "Deprecated accounts with owner permissions should be removed from your subscription.  Deprecated accounts are accounts that have been blocked from signing in."
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
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.Security/assessments",
          "name" : "e52064aa-6853-e252-a11e-dffc675689c2",
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
