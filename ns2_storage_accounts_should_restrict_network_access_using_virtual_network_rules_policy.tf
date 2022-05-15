module "ns2_storage_accounts_should_restrict_network_access_using_virtual_network_rules_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Storage accounts should restrict network access using virtual network rules"
  policy_definition_display_name = "${var.client}-Storage accounts should restrict network access using virtual network rules"
  policy_definition_description  = "Protect your storage accounts from potential threats using virtual network rules as a preferred method instead of IP-based filtering. Disabling IP-based filtering prevents public IPs from accessing your storage accounts."
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
            "anyOf" : [
              {
                "field" : "Microsoft.Storage/storageAccounts/networkAcls.defaultAction",
                "notEquals" : "Deny"
              },
              {
                "count" : {
                  "field" : "Microsoft.Storage/storageAccounts/networkAcls.ipRules[*]"
                },
                "greaterOrEquals" : 1
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
