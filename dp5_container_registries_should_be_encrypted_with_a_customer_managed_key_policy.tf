module "dp5_container_registries_should_be_encrypted_with_a_customer_managed_key_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Container registries should be encrypted with a customer-managed key"
  policy_definition_display_name = "${var.client}-Container registries should be encrypted with a customer-managed key"
  policy_definition_description  = "Use customer-managed keys to manage the encryption at rest of the contents of your registries. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management. Learn more at https://aka.ms/acr/CMK."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Container Registry"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.ContainerRegistry/registries"
          },
          {
            "field" : "Microsoft.ContainerRegistry/registries/encryption.status",
            "notEquals" : "enabled"
          }
        ]
      },
      "then" : {
        "effect" : "Audit"
      }
    }
  )
}
