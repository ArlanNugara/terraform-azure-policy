module "ns6_azure_web_application_firewall_should_be_enabled_for_azure_front_door_entry_points_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Azure Web Application Firewall should be enabled for Azure Front Door entry-points"
  policy_definition_display_name = "${var.client}-Azure Web Application Firewall should be enabled for Azure Front Door entry-points"
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
            "equals" : "Microsoft.Network/frontdoors"
          },
          {
            "field" : "Microsoft.Network/frontdoors/frontendEndpoints[*].webApplicationFirewallPolicyLink.id",
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
