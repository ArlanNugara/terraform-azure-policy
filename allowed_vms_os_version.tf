module "allowed_vms_os_version_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.allowed_vm_os_version_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.allowed_vm_os_version_policy_display_name}"
  policy_definition_description  = var.allowed_vm_os_version_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.allowed_vm_os_version_policy_category}"
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
              "Microsoft.Compute/VirtualMachineScaleSets"
            ]
          },
          {
            "allOf" : [
              {
                "not" : {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/licenseType",
                      "notEquals" : "Windows_Server"
                    },
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "in" : [
                        "MicrosoftWindowsServer",
                        "Invatron"
                      ]
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "in" : [
                        "WindowsServer",
                        "Periscope"
                      ]
                    },
                    {
                      "field" : "Microsoft.Compute/imageSku",
                      "in" : "${var.allowed_windows_os_version}"
                    }
                  ]
                }
              },
              {
                "not" : {
                  "allOf" : [
                    {
                      "field" : "Microsoft.Compute/imagePublisher",
                      "in" : [
                        "RedHat"
                      ]
                    },
                    {
                      "field" : "Microsoft.Compute/imageOffer",
                      "in" : [
                        "RHEL"
                      ]
                    },
                    {
                      "field" : "Microsoft.Compute/imageSku",
                      "in" : "${var.allowed_linux_os_version}"
                    }
                  ]
                }
              }
            ]
          }
        ]
      },
      "then" : {
        "effect" : "${var.allowed_vms_os_version_policy_effect}"
      }
    }
  )
}
