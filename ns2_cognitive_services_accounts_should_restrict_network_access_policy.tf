module "ns2_cognitive_services_accounts_should_restrict_network_access_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Cognitive Services accounts should restrict network access"
  policy_definition_display_name = "${var.client}-Cognitive Services accounts should restrict network access"
  policy_definition_description  = "Network access to Cognitive Services accounts should be restricted. Configure network rules so only applications from allowed networks can access the Cognitive Services account. To allow connections from specific internet or on-premises clients, access can be granted to traffic from specific Azure virtual networks or to public internet IP address ranges."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Cognitive Services"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.CognitiveServices/accounts"
          },
          {
            "field" : "Microsoft.CognitiveServices/accounts/networkAcls.defaultAction",
            "notEquals" : "Deny"
          },
          {
            "count" : {
              "field" : "Microsoft.CognitiveServices/accounts/capabilities[*]",
              "where" : {
                "field" : "Microsoft.CognitiveServices/accounts/capabilities[*].name",
                "equals" : "VirtualNetworks"
              }
            },
            "greater" : 0
          }
        ]
      },
      "then" : {
        "effect" : "Audit"
      }
    }
  )
}
