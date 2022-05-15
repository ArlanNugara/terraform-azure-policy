module "dp6_key_vault_keys_should_have_an_expiration_date_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Key Vault keys should have an expiration date"
  policy_definition_display_name = "${var.client}-Key Vault keys should have an expiration date"
  policy_definition_description  = "Cryptographic keys should have a defined expiration date and not be permanent. Keys that are valid forever provide a potential attacker with more time to compromise the key. It is a recommended security practice to set expiration dates on cryptographic keys."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Key Vault"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.KeyVault.Data/vaults/keys"
          },
          {
            "field" : "Microsoft.KeyVault.Data/vaults/keys/attributes.expiresOn",
            "exists" : false
          }
        ]
      },
      "then" : {
        "effect" : "Audit"
      }
    }
  )
}
