module "pv6_ensure_that_java_version_is_the_latest__if_used_as_a_part_of_the_function_app_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Ensure that 'Java version' is the latest, if used as a part of the Function app"
  policy_definition_display_name = "${var.client}-Ensure that 'Java version' is the latest, if used as a part of the Function app"
  policy_definition_description  = "Periodically, newer versions are released for Java software either due to security flaws or to include additional functionality. Using the latest Java version for Function apps is recommended in order to take advantage of security fixes, if any, and/or new functionalities of the latest version. Currently, this policy only applies to Linux web apps."
  policy_definition_metadata = jsonencode(
    {
      "category" : "App Service"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.Web/sites"
          },
          {
            "field" : "kind",
            "like" : "functionapp*"
          },
          {
            "field" : "kind",
            "contains" : "linux"
          }
        ]
      },
      "then" : {
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.Web/sites/config",
          "name" : "web",
          "existenceCondition" : {
            "anyOf" : [
              {
                "field" : "Microsoft.Web/sites/config/web.linuxFxVersion",
                "notContains" : "JAVA"
              },
              {
                "field" : "Microsoft.Web/sites/config/web.linuxFxVersion",
                "like" : "[concat('*', parameters('JavaLatestVersion'))]"
              }
            ]
          }
        }
      }
    }
  )
}
