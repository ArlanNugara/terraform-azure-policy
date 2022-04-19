module "lt5_log_analytics_agent_should_be_installed_on_your_virtual_machine_for_azure_security_center_monitoring_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Log Analytics agent should be installed on your virtual machine for Azure Security Center monitoring"
  policy_definition_display_name = "${var.client}-Log Analytics agent should be installed on your virtual machine for Azure Security Center monitoring"
  policy_definition_description  = "This policy audits any Windows/Linux virtual machines (VMs) if the Log Analytics agent is not installed which Security Center uses to monitor for security vulnerabilities and threats"
  policy_definition_metadata = jsonencode(
    {
      "category" : "Security Center"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "in" : [
          "Microsoft.ClassicCompute/virtualMachines",
          "Microsoft.Compute/virtualMachines"
        ]
      },
      "then" : {
        "effect" : "[parameters('effect')]",
        "details" : {
          "type" : "Microsoft.Security/assessments",
          "name" : "d1db3318-01ff-16de-29eb-28b344515626",
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
