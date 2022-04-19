module "es2_endpoint_protection_solution_should_be_installed_on_virtual_machine_scale_sets_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Endpoint protection solution should be installed on virtual machine scale sets"
  policy_definition_display_name = "${var.client}-Endpoint protection solution should be installed on virtual machine scale sets"
  policy_definition_description  = "Audit the existence and health of an endpoint protection solution on your virtual machines scale sets, to protect them from threats and vulnerabilities."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Security Center"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "Microsoft.Compute/virtualMachineScaleSets"
      },
      "then" : {
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.Security/assessments",
          "name" : "e71020c2-860c-3235-cd39-04f3f8c936d2",
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
