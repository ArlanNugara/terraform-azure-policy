module "ns2_storage_account_public_access_should_be_disallowed_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Storage account public access should be disallowed"
  policy_definition_display_name = "${var.client}-Storage account public access should be disallowed"
  policy_definition_description  = "Anonymous public read access to containers and blobs in Azure Storage is a convenient way to share data but might present security risks. To prevent data breaches caused by undesired anonymous access, Microsoft recommends preventing public access to a storage account unless your scenario requires it."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Storage"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.Storage/storageAccounts"
          },
          {
            "not" : {
              "allOf" : [
                {
                  "field" : "id",
                  "contains" : "/resourceGroups/aro-"
                },
                {
                  "anyOf" : [
                    {
                      "field" : "name",
                      "like" : "cluster*"
                    },
                    {
                      "field" : "name",
                      "like" : "imageregistry*"
                    }
                  ]
                }
              ]
            }
          },
          {
            "not" : {
              "field" : "Microsoft.Storage/storageAccounts/allowBlobPublicAccess",
              "equals" : "false"
            }
          }
        ]
      },
      "then" : {
        "effect" : "Audit"
      }
    }
  )
}
