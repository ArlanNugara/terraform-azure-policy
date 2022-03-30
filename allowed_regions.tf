module "allowed_regions_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.allowed_regions_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.allowed_regions_policy_display_name}"
  policy_definition_description  = var.allowed_regions_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.allowed_regions_policy_category}"
    }
  )
  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "location",
            "notIn" : "${var.allowed_regions}"
          },
          {
            "field" : "location",
            "notEquals" : "global"
          },
          {
            "field" : "type",
            "notEquals" : "Microsoft.AzureActiveDirectory/b2cDirectories"
          }
        ]
      },
      "then" : {
        "effect" : "${var.allowed_regions_policy_effect}"
      }
    }
  )
}