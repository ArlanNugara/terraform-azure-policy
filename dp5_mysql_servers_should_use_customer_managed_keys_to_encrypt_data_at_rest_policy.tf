module "dp5_mysql_servers_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-MySQL servers should use customer-managed keys to encrypt data at rest"
  policy_definition_display_name = "${var.client}-MySQL servers should use customer-managed keys to encrypt data at rest"
  policy_definition_description  = "Use customer-managed keys to manage the encryption at rest of your MySQL servers. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  policy_definition_metadata = jsonencode(
    {
      "category" : "SQL"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "Microsoft.DBforMySQL/servers"
      },
      "then" : {
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.DBforMySQL/servers/keys",
          "existenceCondition" : {
            "allOf" : [
              {
                "field" : "Microsoft.DBforMySQL/servers/keys/serverKeyType",
                "equals" : "AzureKeyVault"
              },
              {
                "field" : "Microsoft.DBforMySQL/servers/keys/uri",
                "notEquals" : ""
              },
              {
                "field" : "Microsoft.DBforMySQL/servers/keys/uri",
                "exists" : "true"
              }
            ]
          }
        }
      }
    }
  )
}
