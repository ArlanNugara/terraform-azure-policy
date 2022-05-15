module "ir2_email_notification_for_high_severity_alerts_should_be_enabled_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Email notification for high severity alerts should be enabled"
  policy_definition_display_name = "${var.client}-Email notification for high severity alerts should be enabled"
  policy_definition_description  = "To ensure the relevant people in your organization are notified when there is a potential security breach in one of your subscriptions, enable email notifications for high severity alerts in Security Center."
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
          "existenceCondition" : {
            "field" : "Microsoft.Security/securityContacts/alertNotifications",
            "notEquals" : "Off"
          }
        }
      }
    }
  )
}
