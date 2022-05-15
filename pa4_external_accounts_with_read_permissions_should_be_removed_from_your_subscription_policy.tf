module "pa4_external_accounts_with_read_permissions_should_be_removed_from_your_subscription_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-External accounts with read permissions should be removed from your subscription"
  policy_definition_display_name = "${var.client}-External accounts with read permissions should be removed from your subscription"
  policy_definition_description  = "External accounts with read privileges should be removed from your subscription in order to prevent unmonitored access."
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
          "name" : "a8c6a4ad-d51e-88fe-2979-d3ee3c864f8b",
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
