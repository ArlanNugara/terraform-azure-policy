module "ns3_management_ports_should_be_closed_on_your_virtual_machines_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Management ports should be closed on your virtual machines"
  policy_definition_display_name = "${var.client}-Management ports should be closed on your virtual machines"
  policy_definition_description  = "Open remote management ports are exposing your VM to a high level of risk from Internet-based attacks. These attacks attempt to brute force credentials to gain admin access to the machine."
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
          "name" : "bc303248-3d14-44c2-96a0-55f5c326b5fe",
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
