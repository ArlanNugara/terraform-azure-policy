module "dp3_kubernetes_clusters_should_be_accessible_only_over_https_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Kubernetes clusters should be accessible only over HTTPS"
  policy_definition_display_name = "${var.client}-Kubernetes clusters should be accessible only over HTTPS"
  policy_definition_description  = "Use of HTTPS ensures authentication and protects data in transit from network layer eavesdropping attacks. This capability is currently generally available for Kubernetes Service (AKS), and in preview for AKS Engine and Azure Arc enabled Kubernetes. For more info, visit https://aka.ms/kubepolicydoc"
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
        "effect" : "Deny",
        "details" : {
          "constraintTemplate" : "https://store.policy.core.windows.net/kubernetes/ingress-https-only/v1/template.yaml",
          "constraint" : "https://store.policy.core.windows.net/kubernetes/ingress-https-only/v1/constraint.yaml",
          "excludedNamespaces" : "[parameters('excludedNamespaces')]",
          "namespaces" : "[parameters('namespaces')]",
          "labelSelector" : "[parameters('labelSelector')]"
        }
      }
    }
  )
}
