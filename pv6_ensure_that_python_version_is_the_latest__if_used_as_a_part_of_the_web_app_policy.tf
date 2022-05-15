module "pv6_ensure_that_python_version_is_the_latest__if_used_as_a_part_of_the_web_app_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Ensure that 'Python version' is the latest, if used as a part of the Web app"
  policy_definition_display_name = "${var.client}-Ensure that 'Python version' is the latest, if used as a part of the Web app"
  policy_definition_description  = "Periodically, newer versions are released for Python software either due to security flaws or to include additional functionality. Using the latest Python version for web apps is recommended in order to take advantage of security fixes, if any, and/or new functionalities of the latest version. Currently, this policy only applies to Linux web apps."
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
            "like" : "app*"
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
                "notContains" : "PYTHON"
              },
              {
                "field" : "Microsoft.Web/sites/config/web.linuxFxVersion",
                "equals" : "[concat('PYTHON|', parameters('LinuxPythonLatestVersion'))]"
              }
            ]
          }
        }
      }
    }
  )
}
