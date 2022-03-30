module "network_watcher_enable_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.network_watcher_enable_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.network_watcher_enable_policy_display_name}"
  policy_definition_description  = var.network_watcher_enable_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.network_watcher_enable_policy_category}"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "Microsoft.Network/virtualNetworks"
      },
      "then" : {
        "effect" : "${var.network_watcher_enable_policy_effect}",
        "details" : {
          "type" : "Microsoft.Network/networkWatchers",
          "resourceGroupName" : "${var.network_watcher_resource_group_name}",
          "existenceCondition" : {
            "field" : "location",
            "equals" : "[field('location')]"
          }
        }
      }
    }
  )
}