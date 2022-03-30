module "storage_account_key_expiry_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.storage_account_key_expiry_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.storage_account_key_expiry_policy_display_name}"
  policy_definition_description  = var.storage_account_key_expiry_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.storage_account_key_expiry_policy_category}"
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
            "anyOf" : [
              {
                "value" : "[utcNow()]",
                "greater" : "[if(and(not(empty(coalesce(field('Microsoft.Storage/storageAccounts/keyCreationTime.key1'), ''))), not(empty(string(coalesce(field('Microsoft.Storage/storageAccounts/keyPolicy.keyExpirationPeriodInDays'), ''))))), addDays(field('Microsoft.Storage/storageAccounts/keyCreationTime.key1'), field('Microsoft.Storage/storageAccounts/keyPolicy.keyExpirationPeriodInDays')), utcNow())]"
              },
              {
                "value" : "[utcNow()]",
                "greater" : "[if(and(not(empty(coalesce(field('Microsoft.Storage/storageAccounts/keyCreationTime.key2'), ''))), not(empty(string(coalesce(field('Microsoft.Storage/storageAccounts/keyPolicy.keyExpirationPeriodInDays'), ''))))), addDays(field('Microsoft.Storage/storageAccounts/keyCreationTime.key2'), field('Microsoft.Storage/storageAccounts/keyPolicy.keyExpirationPeriodInDays')), utcNow())]"
              }
            ]
          }
        ]
      },
      "then" : {
        "effect" : "${var.storage_account_key_expiry_policy_effect}"
      }
    }
  )
}