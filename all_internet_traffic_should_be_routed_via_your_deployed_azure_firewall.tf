module "all_internet_traffic_should_be_routed_via_your_deployed_azure_firewall_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}All Internet traffic should be routed via your deployed Azure Firewall"
  policy_definition_display_name = "${var.org_prefix}Azure Security Center has identified that some of your subnets aren't protected with a next generation firewall. Protect your subnets from potential threats by restricting access to them with Azure Firewall or a supported next generation firewall"
  policy_definition_description  = "Azure Security Center analyzes the traffic patterns of Internet facing virtual machines and provides Network Security Group rule recommendations that reduce the potential attack surface"
  policy_definition_metadata = jsonencode(
    {
      "category" : "Network"
    }
  )
  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "Microsoft.Compute/virtualMachines"
      },
      "then" : {
        "effect" : "${var.all_internet_traffic_should_be_routed_via_your_deployed_azure_firewall_policy_effect}",
        "details" : {
          "type" : "Microsoft.Security/assessments",
          "name" : "f9f0eed0-f143-47bf-b856-671ea2eeed62",
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