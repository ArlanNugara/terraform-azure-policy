module "pv2_kubernetes_clusters_should_not_use_the_default_namespace_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Kubernetes clusters should not use the default namespace"
  policy_definition_display_name = "${var.client}-Kubernetes clusters should not use the default namespace"
  policy_definition_description  = "Prevent usage of the default namespace in Kubernetes clusters to protect against unauthorized access for ConfigMap, Pod, Secret, Service, and ServiceAccount resource types. For more information, see https://aka.ms/kubepolicydoc."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Kubernetes"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "in" : [
          "AKS Engine",
          "Microsoft.Kubernetes/connectedClusters",
          "Microsoft.ContainerService/managedClusters"
        ]
      },
      "then" : {
        "effect" : "Audit",
        "details" : {
          "constraintTemplate" : "https://store.policy.core.windows.net/kubernetes/block-default-namespace/v1/template.yaml",
          "constraint" : "https://store.policy.core.windows.net/kubernetes/block-default-namespace/v1/constraint.yaml",
          "excludedNamespaces" : "[parameters('excludedNamespaces')]",
          "namespaces" : "[parameters('namespaces')]",
          "labelSelector" : "[parameters('labelSelector')]"
        }
      }
    }
  )
}
