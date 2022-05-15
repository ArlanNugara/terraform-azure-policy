module "am2_storage_accounts_should_be_migrated_to_new_azure_resource_manager_resources_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Storage accounts should be migrated to new Azure Resource Manager resources"
  policy_definition_display_name = "${var.client}-Storage accounts should be migrated to new Azure Resource Manager resources"
  policy_definition_description  = "Use new Azure Resource Manager for your storage accounts to provide security enhancements such as: stronger access control (RBAC), better auditing, Azure Resource Manager based deployment and governance, access to managed identities, access to key vault for secrets, Azure AD-based authentication and support for tags and resource groups for easier security management"
  policy_definition_metadata = jsonencode(
    {
      "category" : "Storage"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "in" : [
              "Microsoft.ClassicStorage/storageAccounts",
              "Microsoft.Storage/StorageAccounts"
            ]
          },
          {
            "value" : "[field('type')]",
            "equals" : "Microsoft.ClassicStorage/storageAccounts"
          }
        ]
      },
      "then" : {
        "effect" : "Audit"
      }
    }
  )
}
