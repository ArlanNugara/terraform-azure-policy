module "ns6_web_application_firewall_waf_should_be_enabled_for_application_gateway_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Web Application Firewall (WAF) should be enabled for Application Gateway"
  policy_definition_display_name = "${var.client}-Web Application Firewall (WAF) should be enabled for Application Gateway"
  policy_definition_description  = "Deploy Azure Web Application Firewall (WAF) in front of public facing web applications for additional inspection of incoming traffic. Web Application Firewall (WAF) provides centralized protection of your web applications from common exploits and vulnerabilities such as SQL injections, Cross-Site Scripting, local and remote file executions. You can also restrict access to your web applications by countries, IP address ranges, and other http(s) parameters via custom rules."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Network"
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
        "effect" : "Audit"
      }
    }
  )
}
