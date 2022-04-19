module "pv4_guest_attestation_extension_should_be_installed_on_supported_windows_virtual_machines_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Guest Attestation extension should be installed on supported Windows virtual machines"
  policy_definition_display_name = "${var.client}-Guest Attestation extension should be installed on supported Windows virtual machines"
  policy_definition_description  = "Install Guest Attestation extension on supported virtual machines to allow Azure Security Center to proactively attest and monitor the boot integrity. Once installed, boot integrity will be attested via Remote Attestation. This assessment only applies to trusted launch enabled virtual machines."
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
            "anyOf" : [
              {
                "field" : "Microsoft.Compute/virtualMachines/storageProfile.imageReference.offer",
                "like" : "windows*"
              },
              {
                "field" : "Microsoft.Compute/virtualMachines/storageProfile.osDisk.osType",
                "like" : "Windows*"
              }
            ]
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
            "field" : "Microsoft.Compute/virtualMachines/securityProfile.uefiSettings.secureBootEnabled",
            "equals" : "true"
          },
          {
            "field" : "Microsoft.Compute/virtualMachines/securityProfile.uefiSettings.vTpmEnabled",
            "equals" : "true"
          }
        ]
      },
      "then" : {
        "effect" : "[parameters('effect')]",
        "details" : {
          "type" : "Microsoft.Compute/virtualMachines/extensions",
          "existenceCondition" : {
            "allOf" : [
              {
                "field" : "Microsoft.Compute/virtualMachines/extensions/publisher",
                "equals" : "Microsoft.Azure.Security.WindowsAttestation"
              },
              {
                "field" : "Microsoft.Compute/virtualMachines/extensions/type",
                "equals" : "GuestAttestation"
              },
              {
                "field" : "Microsoft.Compute/virtualMachines/extensions/provisioningState",
                "in" : [
                  "Succeeded",
                  "Provisioning succeeded"
                ]
              }
            ]
          }
        }
      }
    }
  )
}
