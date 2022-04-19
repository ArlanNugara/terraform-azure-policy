module "ns2_storage_accounts_should_use_private_link_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Storage accounts should use private link"
  policy_definition_display_name = "${var.client}-Storage accounts should use private link"
  policy_definition_description  = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your storage account, data leakage risks are reduced. Learn more about private links at - https://aka.ms/azureprivatelinkoverview"
  policy_definition_metadata = jsonencode(
    {
      "category" : "Storage"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "Microsoft.Storage/storageAccounts"
      },
      "then" : {
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.Storage/storageAccounts/privateEndpointConnections",
          "existenceCondition" : {
            "field" : "Microsoft.Storage/storageAccounts/privateEndpointConnections/privateLinkServiceConnectionState.status",
            "equals" : "Approved"
          }
        }
      }
    }
  )
}
