module "es2_endpoint_protection_should_be_installed_on_your_machines_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Endpoint protection should be installed on your machines"
  policy_definition_display_name = "${var.client}-Endpoint protection should be installed on your machines"
  policy_definition_description  = "To protect your machines from threats and vulnerabilities, install a supported endpoint protection solution."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Security Center"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "in" : [
              "Microsoft.Compute/virtualMachines",
              "Microsoft.ClassicCompute/virtualMachines",
              "Microsoft.HybridCompute/machines"
            ]
          }
        ]
      },
      "then" : {
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.Security/assessments",
          "name" : "4fb67663-9ab9-475d-b026-8c544cced439",
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
