module "dp5_azure_cosmos_db_accounts_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Azure Cosmos DB accounts should use customer-managed keys to encrypt data at rest"
  policy_definition_display_name = "${var.client}-Azure Cosmos DB accounts should use customer-managed keys to encrypt data at rest"
  policy_definition_description  = "Use customer-managed keys to manage the encryption at rest of your Azure Cosmos DB. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management. Learn more at https://aka.ms/cosmosdb-cmk."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Cosmos DB"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "Microsoft.DocumentDB/databaseAccounts/keyVaultKeyUri",
            "exists" : false
          },
          {
            "field" : "type",
            "equals" : "Microsoft.DocumentDB/databaseAccounts"
          }
        ]
      },
      "then" : {
        "effect" : "Audit"
      }
    }
  )
}
