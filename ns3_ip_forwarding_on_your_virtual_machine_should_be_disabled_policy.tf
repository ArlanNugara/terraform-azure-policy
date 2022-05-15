module "ns3_ip_forwarding_on_your_virtual_machine_should_be_disabled_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-IP Forwarding on your virtual machine should be disabled"
  policy_definition_display_name = "${var.client}-IP Forwarding on your virtual machine should be disabled"
  policy_definition_description  = "Enabling IP forwarding on a virtual machine's NIC allows the machine to receive traffic addressed to other destinations. IP forwarding is rarely required (e.g., when using the VM as a network virtual appliance), and therefore, this should be reviewed by the network security team."
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
          "name" : "c3b51c94-588b-426b-a892-24696f9e54cc",
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
