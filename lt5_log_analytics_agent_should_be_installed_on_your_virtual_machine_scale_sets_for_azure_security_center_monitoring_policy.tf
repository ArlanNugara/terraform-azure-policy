module "lt5_log_analytics_agent_should_be_installed_on_your_virtual_machine_scale_sets_for_azure_security_center_monitoring_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Log Analytics agent should be installed on your virtual machine scale sets for Azure Security Center monitoring"
  policy_definition_display_name = "${var.client}-Log Analytics agent should be installed on your virtual machine scale sets for Azure Security Center monitoring"
  policy_definition_description  = "Security Center collects data from your Azure virtual machines (VMs) to monitor for security vulnerabilities and threats."
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
          "Microsoft.Compute/virtualMachineScaleSets"
        ]
      },
      "then" : {
        "effect" : "[parameters('effect')]",
        "details" : {
          "type" : "Microsoft.Security/assessments",
          "name" : "45cfe080-ceb1-a91e-9743-71551ed24e94",
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
