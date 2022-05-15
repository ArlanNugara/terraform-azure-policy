module "dp8_key_vaults_should_have_soft_delete_enabled_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Key vaults should have soft delete enabled"
  policy_definition_display_name = "${var.client}-Key vaults should have soft delete enabled"
  policy_definition_description  = "Deleting a key vault without soft delete enabled permanently deletes all secrets, keys, and certificates stored in the key vault. Accidental deletion of a key vault can lead to permanent data loss. Soft delete allows you to recover an accidentally deleted key vault for a configurable retention period."
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
            "anyOf" : [
              {
                "field" : "Microsoft.KeyVault/vaults/enableSoftDelete",
                "exists" : "false"
              },
              {
                "field" : "Microsoft.KeyVault/vaults/enableSoftDelete",
                "equals" : "false"
              }
            ]
          }
        ]
      },
      "then" : {
        "effect" : "Audit"
      }
    }
  )
}
