module "resource_logs_in_app_services_should_be_enabled_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}Resource logs in App Services should be enabled"
  policy_definition_display_name = "${var.org_prefix}Audit enabling of resource logs on the app. This enables you to recreate activity trails for investigation purposes if a security incident occurs or your network is compromised"
  policy_definition_description  = "Azure Security Center analyzes the traffic patterns of Internet facing virtual machines and provides Network Security Group rule recommendations that reduce the potential attack surface"
  policy_definition_metadata = jsonencode(
    {
      "category" : "App Service"
    }
  )
  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "Microsoft.Compute/virtualMachines"
      },
      "then" : {
        "effect" : "${var.resource_logs_in_app_services_should_be_enabled_policy_effect}",
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