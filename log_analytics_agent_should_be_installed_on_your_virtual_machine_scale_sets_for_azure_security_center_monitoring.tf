module "log_analytics_agent_should_be_installed_on_your_virtual_machine_scale_sets_for_azure_security_center_monitoring_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}Log Analytics agent should be installed on your virtual machine scale sets for Azure Security Center monitoring"
  policy_definition_display_name = "${var.org_prefix}Security Center collects data from your Azure virtual machines (VMs) to monitor for security vulnerabilities and threats"
  policy_definition_description  = "Azure Security Center analyzes the traffic patterns of Internet facing virtual machines and provides Network Security Group rule recommendations that reduce the potential attack surface"
  policy_definition_metadata = jsonencode(
    {
      "category" : "Security Center"
    }
  )
  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "Microsoft.Compute/virtualMachines"
      },
      "then" : {
        "effect" : "${var.log_analytics_agent_should_be_installed_on_your_virtual_machine_scale_sets_for_azure_security_center_monitoring_policy_effect}",
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