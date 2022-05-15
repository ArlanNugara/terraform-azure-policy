module "ir2_subscriptions_should_have_a_contact_email_address_for_security_issues_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Subscriptions should have a contact email address for security issues"
  policy_definition_display_name = "${var.client}-Subscriptions should have a contact email address for security issues"
  policy_definition_description  = "To ensure the relevant people in your organization are notified when there is a potential security breach in one of your subscriptions, set a security contact to receive email notifications from Security Center."
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
            "field" : "Microsoft.Security/securityContacts/email",
            "notEquals" : ""
          }
        }
      }
    }
  )
}
