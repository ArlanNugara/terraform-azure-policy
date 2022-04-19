module "dp4_service_fabric_clusters_should_have_the_clusterprotectionlevel_property_set_to_encryptandsign_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Service Fabric clusters should have the ClusterProtectionLevel property set to EncryptAndSign"
  policy_definition_display_name = "${var.client}-Service Fabric clusters should have the ClusterProtectionLevel property set to EncryptAndSign"
  policy_definition_description  = "Service Fabric provides three levels of protection (None, Sign and EncryptAndSign) for node-to-node communication using a primary cluster certificate. Set the protection level to ensure that all node-to-node messages are encrypted and digitally signed"
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
                "field" : "Microsoft.ServiceFabric/clusters/fabricSettings[*].name",
                "notEquals" : "Security"
              },
              {
                "field" : "Microsoft.ServiceFabric/clusters/fabricSettings[*].parameters[*].name",
                "notEquals" : "ClusterProtectionLevel"
              },
              {
                "field" : "Microsoft.ServiceFabric/clusters/fabricSettings[*].parameters[*].value",
                "notEquals" : "EncryptAndSign"
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
