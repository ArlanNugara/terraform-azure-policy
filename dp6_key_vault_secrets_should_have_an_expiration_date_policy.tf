module "dp6_key_vault_secrets_should_have_an_expiration_date_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Key Vault secrets should have an expiration date"
  policy_definition_display_name = "${var.client}-Key Vault secrets should have an expiration date"
  policy_definition_description  = "Secrets should have a defined expiration date and not be permanent. Secrets that are valid forever provide a potential attacker with more time to compromise them. It is a recommended security practice to set expiration dates on secrets."
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
            "equals" : "Microsoft.KeyVault.Data/vaults/secrets"
          },
          {
            "field" : "Microsoft.KeyVault.Data/vaults/secrets/attributes.expiresOn",
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
