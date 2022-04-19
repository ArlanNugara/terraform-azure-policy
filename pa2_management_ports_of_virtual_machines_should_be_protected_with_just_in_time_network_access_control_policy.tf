module "pa2_management_ports_of_virtual_machines_should_be_protected_with_just_in_time_network_access_control_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Management ports of virtual machines should be protected with just-in-time network access control"
  policy_definition_display_name = "${var.client}-Management ports of virtual machines should be protected with just-in-time network access control"
  policy_definition_description  = "Possible network Just In Time (JIT) access will be monitored by Azure Security Center as recommendations"
  policy_definition_metadata = jsonencode(
    {
      "category" : "Security Center"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "Microsoft.Compute/virtualMachines"
      },
      "then" : {
        "effect" : "[parameters('effect')]",
        "details" : {
          "type" : "Microsoft.Security/assessments",
          "name" : "805651bc-6ecd-4c73-9b55-97a19d0582d0",
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
