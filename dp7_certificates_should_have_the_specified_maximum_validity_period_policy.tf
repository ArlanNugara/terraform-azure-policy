module "dp7_certificates_should_have_the_specified_maximum_validity_period_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Certificates should have the specified maximum validity period"
  policy_definition_display_name = "${var.client}-Certificates should have the specified maximum validity period"
  policy_definition_description  = "Manage your organizational compliance requirements by specifying the maximum amount of time that a certificate can be valid within your key vault."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Key Vault"
    }
  )

  parameters = jsonencode(
    {
      "maximumValidityInMonths" : {
        "type" : "Integer",
        "metadata" : {
          "displayName" : "The maximum validity in months",
          "description" : "The limit to how long a certificate may be valid for. Certificates with lengthy validity periods aren't best practice."
        },
        "defaultValue" : 12
      }
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.KeyVault.Data/vaults/certificates"
          },
          {
            "field" : "Microsoft.KeyVault.Data/vaults/certificates/properties.validityInMonths",
            "greater" : "[parameters('maximumValidityInMonths')]"
          }
        ]
      },
      "then" : {
        "effect" : "Audit"
      }
    }
  )
}
