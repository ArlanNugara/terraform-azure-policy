module "tags_mandatory_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.tags_mandatory_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.tags_mandatory_policy_display_name}"
  policy_definition_description  = var.tags_mandatory_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.tags_mandatory_policy_category}"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.Resources/subscriptions/resourceGroups"
          },
          {
            "anyOf" : [
              {
                "field" : "[concat('tags[', parameters('Created By'), ']')]",
                "exists" : "false"
              },
              {
                "field" : "[concat('tags[', parameters('Customer'), ']')]",
                "exists" : "false"
              },
              {
                "field" : "[concat('tags[', parameters('Env'), ']')]",
                "exists" : "false"
              },
              {
                "field" : "[concat('tags[', parameters('Region'), ']')]",
                "exists" : "false"
              }
            ]
          }
        ]
      },
      "then" : {
        "effect" : "${var.tags_mandatory_policy_effect}"
      }
    }
  )

  policy_definition_parameters = jsonencode(
    {
      "Created By" : {
        "type" : "String",
        "value" : "Created By",
        "metadata" : {
          "displayName" : "Created By Tag"
        }
      },
      "Customer" : {
        "type" : "String",
        "value" : "Customer",
        "metadata" : {
          "displayName" : "Customer Tag"
        }
      },
      "Env" : {
        "type" : "String",
        "value" : "Env",
        "metadata" : {
          "displayName" : "Env Tag"
        }
      },
      "Region" : {
        "type" : "String",
        "value" : "Region",
        "metadata" : {
          "displayName" : "Region Tag"
        }
      }
    }
  )
}