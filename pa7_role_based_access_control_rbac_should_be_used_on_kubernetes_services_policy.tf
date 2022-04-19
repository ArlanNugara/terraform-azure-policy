module "pa7_role_based_access_control_rbac_should_be_used_on_kubernetes_services_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Role-Based Access Control (RBAC) should be used on Kubernetes Services"
  policy_definition_display_name = "${var.client}-Role-Based Access Control (RBAC) should be used on Kubernetes Services"
  policy_definition_description  = "To provide granular filtering on the actions that users can perform, use Role-Based Access Control (RBAC) to manage permissions in Kubernetes Service Clusters and configure relevant authorization policies."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Security Center"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.ContainerService/managedClusters"
          },
          {
            "anyOf" : [
              {
                "field" : "Microsoft.ContainerService/managedClusters/enableRBAC",
                "exists" : "false"
              },
              {
                "field" : "Microsoft.ContainerService/managedClusters/enableRBAC",
                "equals" : "false"
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
