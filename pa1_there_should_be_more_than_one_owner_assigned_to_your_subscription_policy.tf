module "pa1_there_should_be_more_than_one_owner_assigned_to_your_subscription_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-There should be more than one owner assigned to your subscription"
  policy_definition_display_name = "${var.client}-There should be more than one owner assigned to your subscription"
  policy_definition_description  = "It is recommended to designate more than one subscription owner in order to have administrator access redundancy."
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
          "name" : "2c79b4af-f830-b61e-92b9-63dfa30f16e4",
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
