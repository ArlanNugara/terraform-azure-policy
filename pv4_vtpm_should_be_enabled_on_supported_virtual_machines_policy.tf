module "pv4_vtpm_should_be_enabled_on_supported_virtual_machines_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-vTPM should be enabled on supported virtual machines"
  policy_definition_display_name = "${var.client}-vTPM should be enabled on supported virtual machines"
  policy_definition_description  = "Enable virtual TPM device on supported virtual machines to facilitate Measured Boot and other OS security features that require a TPM. Once enabled, vTPM can be used to attest boot integrity. This assessment only applies to trusted launch enabled virtual machines."
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
            "equals" : "Microsoft.Compute/virtualMachines"
          },
          {
            "field" : "Microsoft.Compute/virtualMachines/securityProfile.securityType",
            "equals" : "TrustedLaunch"
          },
          {
            "field" : "Microsoft.Compute/virtualMachines/securityProfile.uefiSettings",
            "exists" : "true"
          },
          {
            "field" : "Microsoft.Compute/virtualMachines/securityProfile.uefiSettings.vTpmEnabled",
            "notequals" : "true"
          }
        ]
      },
      "then" : {
        "effect" : "Audit"
      }
    }
  )
}
