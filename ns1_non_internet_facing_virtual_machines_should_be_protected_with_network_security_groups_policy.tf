module "ns1_non_internet_facing_virtual_machines_should_be_protected_with_network_security_groups_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Non-internet-facing virtual machines should be protected with network security groups"
  policy_definition_display_name = "${var.client}-Non-internet-facing virtual machines should be protected with network security groups"
  policy_definition_description  = "Protect your non-internet-facing virtual machines from potential threats by restricting access with network security groups (NSG). Learn more about controlling traffic with NSGs at https://aka.ms/nsg-doc"
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
          "Microsoft.Compute/virtualMachines",
          "Microsoft.ClassicCompute/virtualMachines"
        ]
      },
      "then" : {
        "effect" : "[parameters('effect')]",
        "details" : {
          "type" : "Microsoft.Security/assessments",
          "name" : "a9341235-9389-42f0-a0bf-9bfb57960d44",
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
