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

  parameters = jsonencode(
    {
      "excludedNamespaces" : {
        "type" : "Array",
        "metadata" : {
          "displayName" : "Namespace exclusions",
          "description" : "List of Kubernetes namespaces to exclude from policy evaluation. System namespaces \"kube-system\", \"gatekeeper-system\" and \"azure-arc\" are always excluded by design."
        },
        "defaultValue" : [
          "kube-system",
          "gatekeeper-system",
          "azure-arc"
        ]
      },
      "namespaces" : {
        "type" : "Array",
        "metadata" : {
          "displayName" : "Namespace inclusions",
          "description" : "List of Kubernetes namespaces to only include in policy evaluation. An empty list means the policy is applied to all resources in all namespaces."
        },
        "defaultValue" : []
      },
      "labelSelector" : {
        "type" : "Object",
        "metadata" : {
          "displayName" : "Kubernetes label selector",
          "description" : "Label query to select Kubernetes resources for policy evaluation. An empty label selector matches all Kubernetes resources."
        },
        "defaultValue" : {},
        "schema" : {
          "description" : "A label selector is a label query over a set of resources. The result of matchLabels and matchExpressions are ANDed. An empty label selector matches all resources.",
          "type" : "object",
          "properties" : {
            "matchLabels" : {
              "description" : "matchLabels is a map of {key,value} pairs.",
              "type" : "object",
              "additionalProperties" : {
                "type" : "string"
              },
              "minProperties" : 1
            },
            "matchExpressions" : {
              "description" : "matchExpressions is a list of values, a key, and an operator.",
              "type" : "array",
              "items" : {
                "type" : "object",
                "properties" : {
                  "key" : {
                    "description" : "key is the label key that the selector applies to.",
                    "type" : "string"
                  },
                  "operator" : {
                    "description" : "operator represents a key's relationship to a set of values.",
                    "type" : "string",
                    "enum" : [
                      "In",
                      "NotIn",
                      "Exists",
                      "DoesNotExist"
                    ]
                  },
                  "values" : {
                    "description" : "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty.",
                    "type" : "array",
                    "items" : {
                      "type" : "string"
                    }
                  }
                },
                "required" : [
                  "key",
                  "operator"
                ],
                "additionalProperties" : false
              },
              "minItems" : 1
            }
          },
          "additionalProperties" : false
        }
      },
      "allowedHostPaths" : {
        "type" : "Object",
        "metadata" : {
          "displayName" : "Allowed host paths",
          "description" : "The host paths allowed for pod hostPath volumes to use. Provide an empty paths list to block all host paths."
        },
        "defaultValue" : {
          "paths" : []
        },
        "schema" : {
          "type" : "object",
          "properties" : {
            "paths" : {
              "type" : "array",
              "items" : {
                "type" : "object",
                "properties" : {
                  "pathPrefix" : {
                    "type" : "string"
                  },
                  "readOnly" : {
                    "type" : "boolean"
                  }
                },
                "required" : [
                  "pathPrefix",
                  "readOnly"
                ],
                "additionalProperties" : false
              }
            }
          },
          "required" : [
            "paths"
          ],
          "additionalProperties" : false
        }
      },
      "excludedContainers" : {
        "type" : "Array",
        "metadata" : {
          "displayName" : "Containers exclusions",
          "description" : "The list of InitContainers and Containers to exclude from readonly evaluation. It will not exclude the disallowed host path. The identify is the name of container. Use an empty list to apply this policy to all containers in all namespaces."
        },
        "defaultValue" : []
      }
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
