module "tags_optional_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.tags_optional_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.tags_optional_policy_display_name}"
  policy_definition_description  = var.tags_optional_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.tags_optional_policy_category}"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "anyOf" : [
          {
            "field" : "[concat('tags[', parameters('App'), ']')]",
            "exists" : "false"
          },
          {
            "field" : "[concat('tags[', parameters('Cost Center'), ']')]",
            "exists" : "false"
          },
          {
            "field" : "[concat('tags[', parameters('Department'), ']')]",
            "exists" : "false"
          },
          {
            "field" : "[concat('tags[', parameters('Owner'), ']')]",
            "exists" : "false"
          },
          {
            "field" : "[concat('tags[', parameters('Policy'), ']')]",
            "exists" : "false"
          },
          {
            "field" : "[concat('tags[', parameters('Product'), ']')]",
            "exists" : "false"
          },
          {
            "field" : "[concat('tags[', parameters('Salesforce CST ID'), ']')]",
            "exists" : "false"
          },
          {
            "field" : "[concat('tags[', parameters('SLA Severity'), ']')]",
            "exists" : "false"
          },
          {
            "field" : "[concat('tags[', parameters('Stakeholders'), ']')]",
            "exists" : "false"
          },
          {
            "field" : "[concat('tags[', parameters('Tiers'), ']')]",
            "exists" : "false"
          }
        ]
      },
      "then" : {
        "effect" : "${var.tags_optional_policy_effect}"
      }
    }
  )

  policy_definition_parameters = jsonencode(
    {
      "App" : {
        "type" : "String",
        "value" : "App",
        "metadata" : {
          "displayName" : "App Tag"
        }
      },
      "Cost Center" : {
        "type" : "String",
        "value" : "Cost Center",
        "metadata" : {
          "displayName" : "Cost Center Tag"
        }
      },
      "Department" : {
        "type" : "String",
        "value" : "Department",
        "metadata" : {
          "displayName" : "Department Tag"
        }
      },
      "Owner" : {
        "type" : "String",
        "value" : "Owner",
        "metadata" : {
          "displayName" : "Owner Tag"
        }
      },
      "Policy" : {
        "type" : "String",
        "value" : "Policy",
        "metadata" : {
          "displayName" : "Policy Tag"
        }
      },
      "Product" : {
        "type" : "String",
        "value" : "Product",
        "metadata" : {
          "displayName" : "Product Tag"
        }
      },
      "Salesforce CST ID" : {
        "type" : "String",
        "value" : "Salesforce CST ID Tag",
        "metadata" : {
          "displayName" : "Salesforce CST ID Tag"
        }
      },
      "SLA Severity" : {
        "type" : "String",
        "value" : "SLA Severity Tag",
        "metadata" : {
          "displayName" : "SLA Severity Tag"
        }
      },
      "Stakeholders" : {
        "type" : "String",
        "value" : "Stakeholder",
        "metadata" : {
          "displayName" : "Stakeholders Tag"
        }
      },
      "Tiers" : {
        "type" : "String",
        "value" : "Tiers",
        "metadata" : {
          "displayName" : "Tiers Tag"
        }
      }
    }
  )
}