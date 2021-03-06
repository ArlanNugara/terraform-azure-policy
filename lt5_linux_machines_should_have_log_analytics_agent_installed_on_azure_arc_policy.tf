module "lt5_linux_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Linux machines should have Log Analytics agent installed on Azure Arc"
  policy_definition_display_name = "${var.client}-Linux machines should have Log Analytics agent installed on Azure Arc"
  policy_definition_description  = "Machines are non-compliant if Log Analytics agent is not installed on Azure Arc enabled Linux server."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Guest Configuration"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "value" : "false",
            "equals" : "true"
          },
          {
            "field" : "type",
            "equals" : "Microsoft.HybridCompute/machines"
          },
          {
            "field" : "Microsoft.HybridCompute/imageOffer",
            "like" : "linux*"
          }
        ]
      },
      "then" : {
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.GuestConfiguration/guestConfigurationAssignments",
          "name" : "LinuxLogAnalyticsAgentInstalled",
          "existenceCondition" : {
            "field" : "Microsoft.GuestConfiguration/guestConfigurationAssignments/complianceStatus",
            "equals" : "Compliant"
          }
        }
      }
    }
  )
}
