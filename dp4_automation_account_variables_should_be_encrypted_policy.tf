module "dp4_automation_account_variables_should_be_encrypted_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Automation account variables should be encrypted"
  policy_definition_display_name = "${var.client}-Automation account variables should be encrypted"
  policy_definition_description  = "It is important to enable encryption of Automation account variable assets when storing sensitive data"
  policy_definition_metadata = jsonencode(
    {
      "category" : "Automation"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.Automation/automationAccounts/variables"
          },
          {
            "field" : "Microsoft.Automation/automationAccounts/variables/isEncrypted",
            "notEquals" : "true"
          }
        ]
      },
      "then" : {
        "effect" : "Audit"
      }
    }
  )
}
