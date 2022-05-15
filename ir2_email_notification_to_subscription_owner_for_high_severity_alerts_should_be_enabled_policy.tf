module "ir2_email_notification_to_subscription_owner_for_high_severity_alerts_should_be_enabled_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Email notification to subscription owner for high severity alerts should be enabled"
  policy_definition_display_name = "${var.client}-Email notification to subscription owner for high severity alerts should be enabled"
  policy_definition_description  = "To ensure your subscription owners are notified when there is a potential security breach in their subscription, set email notifications to subscription owners for high severity alerts in Security Center."
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
          "type" : "Microsoft.Security/securityContacts",
          "existenceScope" : "subscription",
          "existenceCondition" : {
            "not" : {
              "allOf" : [
                {
                  "field" : "Microsoft.Security/securityContacts/alertsToAdmins",
                  "equals" : "Off"
                },
                {
                  "field" : "Microsoft.Security/securityContacts/alertNotifications.minimalSeverity",
                  "equals" : "High"
                }
              ]
            }
          }
        }
      }
    }
  )
}
