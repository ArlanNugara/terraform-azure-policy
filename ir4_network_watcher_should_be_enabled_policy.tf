module "ir4_network_watcher_should_be_enabled_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Network Watcher should be enabled"
  policy_definition_display_name = "${var.client}-Network Watcher should be enabled"
  policy_definition_description  = "Network Watcher is a regional service that enables you to monitor and diagnose conditions at a network scenario level in, to, and from Azure. Scenario level monitoring enables you to diagnose problems at an end to end network level view. It is required to have a network watcher resource group to be created in every region where a virtual network is present. An alert is enabled if a network watcher resource group is not available in a particular region."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Network"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "Microsoft.Network/virtualNetworks"
      },
      "then" : {
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.Network/networkWatchers",
          "resourceGroupName" : "[parameters('resourceGroupName')]",
          "existenceCondition" : {
            "field" : "location",
            "equals" : "[field('location')]"
          }
        }
      }
    }
  )
}
