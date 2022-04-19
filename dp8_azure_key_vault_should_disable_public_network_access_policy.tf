module "dp8_azure_key_vault_should_disable_public_network_access_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Azure Key Vault should disable public network access"
  policy_definition_display_name = "${var.client}-Azure Key Vault should disable public network access"
  policy_definition_description  = "Disable public network access for your key vault so that it's not accessible over the public internet. This can reduce data leakage risks. Learn more at: https://aka.ms/akvprivatelink."
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
            "equals" : "Microsoft.KeyVault/vaults"
          },
          {
            "not" : {
              "field" : "Microsoft.KeyVault/vaults/createMode",
              "equals" : "recover"
            }
          },
          {
            "field" : "Microsoft.KeyVault/vaults/networkAcls.defaultAction",
            "notEquals" : "Deny"
          }
        ]
      },
      "then" : {
        "effect" : "Audit"
      }
    }
  )
}
