module "im6_mfa_should_be_enabled_on_accounts_with_read_permissions_on_your_subscription_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-MFA should be enabled on accounts with read permissions on your subscription"
  policy_definition_display_name = "${var.client}-MFA should be enabled on accounts with read permissions on your subscription"
  policy_definition_description  = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with read privileges to prevent a breach of accounts or resources."
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
          "name" : "151e82c5-5341-a74b-1eb0-bc38d2c84bb5",
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
