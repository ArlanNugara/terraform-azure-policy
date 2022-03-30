module "vm_management_port_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.vm_management_port_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.vm_management_port_policy_display_name}"
  policy_definition_description  = var.vm_management_port_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.vm_management_port_policy_category}"
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
        "effect" : "${var.vm_management_port_policy_effect}",
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