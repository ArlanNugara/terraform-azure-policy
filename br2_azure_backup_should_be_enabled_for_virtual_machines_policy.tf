module "br2_azure_backup_should_be_enabled_for_virtual_machines_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Azure Backup should be enabled for Virtual Machines"
  policy_definition_display_name = "${var.client}-Azure Backup should be enabled for Virtual Machines"
  policy_definition_description  = "Ensure protection of your Azure Virtual Machines by enabling Azure Backup. Azure Backup is a secure and cost effective data protection solution for Azure."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Backup"
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
            "field" : "id",
            "notContains" : "/resourceGroups/databricks-rg-"
          },
          {
            "field" : "Microsoft.Compute/imagePublisher",
            "notEquals" : "azureopenshift"
          },
          {
            "field" : "Microsoft.Compute/imagePublisher",
            "notEquals" : "AzureDatabricks"
          }
        ]
      },
      "then" : {
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.RecoveryServices/backupprotecteditems"
        }
      }
    }
  )
}
