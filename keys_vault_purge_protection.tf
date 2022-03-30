module "keys_vault_purge_protection_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.keys_vault_purge_protection_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.keys_vault_purge_protection_policy_display_name}"
  policy_definition_description  = var.keys_vault_purge_protection_policy_description
  policy_definition_metadata = jsonencode({
    "category" : "${var.keys_vault_purge_protection_policy_category}"
  })

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
                "field" : "Microsoft.KeyVault/vaults/enablePurgeProtection",
                "exists" : "false"
              },
              {
                "field" : "Microsoft.KeyVault/vaults/enableSoftDelete",
                "equals" : "false"
              },
              {
                "field" : "Microsoft.KeyVault/vaults/enablePurgeProtection",
                "equals" : "false"
              }
            ]
          }
        ]
      },
      "then" : {
        "effect" : "${var.keys_vault_purge_protection_policy_effect}"
      }
    }
  )
}