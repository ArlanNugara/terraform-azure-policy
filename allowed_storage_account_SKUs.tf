module "allowed_storage_account_SKUs_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.allowed_storage_account_sku_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.allowed_storage_account_sku_policy_display_name}"
  policy_definition_description  = var.allowed_storage_account_sku_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.allowed_storage_account_sku_policy_category}"
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
              "field" : "Microsoft.Storage/storageAccounts/sku.name",
              "in" : "${var.allowed_storage_account_SKUs}"
            }
          }
        ]
      },
      "then" : {
        "effect" : "${var.allowed_storage_account_SKUs_policy_effect}"
      }
    }
  )
}
