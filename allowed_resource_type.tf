module "allowed_resource_type_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.allowed_resource_type_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.allowed_resource_type_policy_display_name}"
  policy_definition_description  = var.allowed_resource_type_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.allowed_resource_type_policy_category}"
    }
  )
  policy_definition_rule = jsonencode(
    {
      "if" : {
        "not" : {
          "field" : "type",
          "in" : "${var.allowed_resource_type}"
        }
      },
      "then" : {
        "effect" : "${var.allowed_resource_type_policy_effect}"
      }
    }
  )
}
