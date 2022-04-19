module "dp4_virtual_machines_should_encrypt_temp_disks__caches__and_data_flows_between_compute_and_storage_resources_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources"
  policy_definition_display_name = "${var.client}-Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources"
  policy_definition_description  = "By default, a virtual machine's OS and data disks are encrypted-at-rest using platform-managed keys. Temp disks, data caches and data flowing between compute and storage aren't encrypted. Disregard this recommendation if: 1. using encryption-at-host, or 2. server-side encryption on Managed Disks meets your security requirements. Learn more in: Server-side encryption of Azure Disk Storage: https://aka.ms/disksse, Different disk encryption offerings: https://aka.ms/diskencryptioncomparison"
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
          "Microsoft.ClassicCompute/virtualMachines",
          "Microsoft.Compute/virtualMachines"
        ]
      },
      "then" : {
        "effect" : "[parameters('effect')]",
        "details" : {
          "type" : "Microsoft.Security/assessments",
          "name" : "d57a4221-a804-52ca-3dea-768284f06bb7",
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
