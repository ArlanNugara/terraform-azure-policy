module "pv2_kubernetes_cluster_pods_should_only_use_approved_host_network_and_port_range_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Kubernetes cluster pods should only use approved host network and port range"
  policy_definition_display_name = "${var.client}-Kubernetes cluster pods should only use approved host network and port range"
  policy_definition_description  = "Restrict pod access to the host network and the allowable host port range in a Kubernetes cluster. This recommendation is part of CIS 5.2.4 which is intended to improve the security of your Kubernetes environments. This policy is generally available for Kubernetes Service (AKS), and preview for AKS Engine and Azure Arc enabled Kubernetes. For more information, see https://aka.ms/kubepolicydoc."
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
        "effect" : "[parameters('effect')]",
        "details" : {
          "constraintTemplate" : "https://store.policy.core.windows.net/kubernetes/host-network-ports/v2/template.yaml",
          "constraint" : "https://store.policy.core.windows.net/kubernetes/host-network-ports/v2/constraint.yaml",
          "excludedNamespaces" : "[parameters('excludedNamespaces')]",
          "namespaces" : "[parameters('namespaces')]",
          "labelSelector" : "[parameters('labelSelector')]",
          "values" : {
            "allowHostNetwork" : "[parameters('allowHostNetwork')]",
            "minPort" : "[parameters('minPort')]",
            "maxPort" : "[parameters('maxPort')]",
            "excludedContainers" : "[parameters('excludedContainers')]"
          }
        }
      }
    }
  )
}
