module "pa1_a_maximum_of_3_owners_should_be_designated_for_your_subscription_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-A maximum of 3 owners should be designated for your subscription"
  policy_definition_display_name = "${var.client}-A maximum of 3 owners should be designated for your subscription"
  policy_definition_description  = "It is recommended to designate up to 3 subscription owners in order to reduce the potential for breach by a compromised owner."
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
          "name" : "6f90a6d6-d4d6-0794-0ec1-98fa77878c2e",
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
