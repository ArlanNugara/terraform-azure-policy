module "ns5_azure_ddos_protection_standard_should_be_enabled_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Azure DDoS Protection Standard should be enabled"
  policy_definition_display_name = "${var.client}-Azure DDoS Protection Standard should be enabled"
  policy_definition_description  = "DDoS protection standard should be enabled for all virtual networks with a subnet that is part of an application gateway with a public IP."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Security Center"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "microsoft.network/virtualNetworks"
      },
      "then" : {
        "effect" : "[parameters('effect')]",
        "details" : {
          "type" : "Microsoft.Security/assessments",
          "name" : "e3de1cc0-f4dd-3b34-e496-8b5381ba2d70",
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
