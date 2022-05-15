module "ns1_internet_facing_virtual_machines_should_be_protected_with_network_security_groups_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Internet-facing virtual machines should be protected with network security groups"
  policy_definition_display_name = "${var.client}-Internet-facing virtual machines should be protected with network security groups"
  policy_definition_description  = "Protect your virtual machines from potential threats by restricting access to them with network security groups (NSG). Learn more about controlling traffic with NSGs at https://aka.ms/nsg-doc"
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
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.Security/assessments",
          "name" : "483f12ed-ae23-447e-a2de-a67a10db4353",
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
