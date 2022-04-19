module "im1_service_fabric_clusters_should_only_use_azure_active_directory_for_client_authentication_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Service Fabric clusters should only use Azure Active Directory for client authentication"
  policy_definition_display_name = "${var.client}-Service Fabric clusters should only use Azure Active Directory for client authentication"
  policy_definition_description  = "Audit usage of client authentication only via Azure Active Directory in Service Fabric"
  policy_definition_metadata = jsonencode(
    {
      "category" : "Service Fabric"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.ServiceFabric/clusters"
          },
          {
            "anyOf" : [
              {
                "field" : "Microsoft.ServiceFabric/clusters/azureActiveDirectory.tenantId",
                "exists" : "false"
              },
              {
                "field" : "Microsoft.ServiceFabric/clusters/azureActiveDirectory.tenantId",
                "equals" : ""
              }
            ]
          }
        ]
      },
      "then" : {
        "effect" : "Audit"
      }
    }
  )
}
