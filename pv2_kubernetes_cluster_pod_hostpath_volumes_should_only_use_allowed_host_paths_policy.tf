module "pv2_kubernetes_cluster_pod_hostpath_volumes_should_only_use_allowed_host_paths_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Kubernetes cluster pod hostPath volumes should only use allowed host paths"
  policy_definition_display_name = "${var.client}-Kubernetes cluster pod hostPath volumes should only use allowed host paths"
  policy_definition_description  = "Limit pod HostPath volume mounts to the allowed host paths in a Kubernetes Cluster. This recommendation is part of Pod Security Policies which are intended to improve the security of your Kubernetes environments. This policy is generally available for Kubernetes Service (AKS), and preview for AKS Engine and Azure Arc enabled Kubernetes. For more information, see https://aka.ms/kubepolicydoc."
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
          "constraintTemplate" : "https://store.policy.core.windows.net/kubernetes/allowed-host-paths/v2/template.yaml",
          "constraint" : "https://store.policy.core.windows.net/kubernetes/allowed-host-paths/v2/constraint.yaml",
          "excludedNamespaces" : "[parameters('excludedNamespaces')]",
          "namespaces" : "[parameters('namespaces')]",
          "labelSelector" : "[parameters('labelSelector')]",
          "values" : {
            "allowedHostPaths" : "[parameters('allowedHostPaths').paths]",
            "excludedContainers" : "[parameters('excludedContainers')]"
          }
        }
      }
    }
  )
}
