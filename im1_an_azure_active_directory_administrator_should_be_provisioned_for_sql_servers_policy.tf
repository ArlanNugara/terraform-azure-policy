module "im1_an_azure_active_directory_administrator_should_be_provisioned_for_sql_servers_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-An Azure Active Directory administrator should be provisioned for SQL servers"
  policy_definition_display_name = "${var.client}-An Azure Active Directory administrator should be provisioned for SQL servers"
  policy_definition_description  = "Audit provisioning of an Azure Active Directory administrator for your SQL server to enable Azure AD authentication. Azure AD authentication enables simplified permission management and centralized identity management of database users and other Microsoft services"
  policy_definition_metadata = jsonencode(
    {
      "category" : "SQL"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "Microsoft.Sql/servers"
      },
      "then" : {
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.Sql/servers/administrators"
        }
      }
    }
  )
}
