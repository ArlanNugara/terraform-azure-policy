module "waf_application_gateway_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.waf_application_gateway_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.waf_application_gateway_policy_display_name}"
  policy_definition_description  = var.waf_application_gateway_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.waf_application_gateway_policy_category}"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.Network/applicationGateways"
          },
          {
            "field" : "Microsoft.Network/applicationGateways/webApplicationFirewallConfiguration",
            "exists" : "false"
          },
          {
            "field" : "Microsoft.Network/applicationGateways/firewallPolicy",
            "exists" : "false"
          }
        ]
      },
      "then" : {
        "effect" : "${var.waf_application_gateway_policy_effect}"
      }
    }
  )
}