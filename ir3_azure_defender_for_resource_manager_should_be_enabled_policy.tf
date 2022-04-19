module "ir3_azure_defender_for_resource_manager_should_be_enabled_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Azure Defender for Resource Manager should be enabled"
  policy_definition_display_name = "${var.client}-Azure Defender for Resource Manager should be enabled"
  policy_definition_description  = "Azure Defender for Resource Manager automatically monitors the resource management operations in your organization. Azure Defender detects threats and alerts you about suspicious activity. Learn more about the capabilities of Azure Defender for Resource Manager at https://aka.ms/defender-for-resource-manager . Enabling this Azure Defender plan results in charges. Learn about the pricing details per region on Security Center's pricing page: https://aka.ms/pricing-security-center ."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Security Center"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "Microsoft.Resources/subscriptions"
      },
      "then" : {
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.Security/pricings",
          "name" : "Arm",
          "existenceScope" : "subscription",
          "existenceCondition" : {
            "field" : "Microsoft.Security/pricings/pricingTier",
            "equals" : "Standard"
          }
        }
      }
    }
  )
}
