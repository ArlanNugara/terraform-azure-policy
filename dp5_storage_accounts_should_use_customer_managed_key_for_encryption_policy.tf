module "dp5_storage_accounts_should_use_customer_managed_key_for_encryption_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Storage accounts should use customer-managed key for encryption"
  policy_definition_display_name = "${var.client}-Storage accounts should use customer-managed key for encryption"
  policy_definition_description  = "Secure your blob and file storage account with greater flexibility using customer-managed keys. When you specify a customer-managed key, that key is used to protect and control access to the key that encrypts your data. Using customer-managed keys provides additional capabilities to control rotation of the key encryption key or cryptographically erase data."
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
            "equals" : "Microsoft.Storage/storageAccounts"
          },
          {
            "not" : {
              "field" : "Microsoft.Storage/storageAccounts/encryption.keySource",
              "equals" : "Microsoft.Keyvault"
            }
          }
        ]
      },
      "then" : {
        "effect" : "Audit"
      }
    }
  )
}
