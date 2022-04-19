module "ns1_all_network_ports_should_be_restricted_on_network_security_groups_associated_to_your_virtual_machine_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-All network ports should be restricted on network security groups associated to your virtual machine"
  policy_definition_display_name = "${var.client}-All network ports should be restricted on network security groups associated to your virtual machine"
  policy_definition_description  = "Azure Security Center has identified some of your network security groups' inbound rules to be too permissive. Inbound rules should not allow access from 'Any' or 'Internet' ranges. This can potentially enable attackers to target your resources."
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
          "name" : "3b20e985-f71f-483b-b078-f30d73936d43",
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
