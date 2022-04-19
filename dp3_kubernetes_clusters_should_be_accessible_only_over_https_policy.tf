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
