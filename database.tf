// Database Policy

resource "azurerm_policy_set_definition" "mysql" {
  name                = "${var.mg_identification}-mysql-pol-set"
  display_name        = "${upper(var.mg_identification)} - MySQL Governance Set"
  policy_type         = "Custom"
  management_group_id = data.azurerm_management_group.ccc.id
  metadata = jsonencode(
    {
      "category" : "Database"
    }
  )
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/40e85574-ef33-47e8-a854-7a65c7500560"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/146412e9-005c-472b-9e48-c87b72ac229e"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/82339799-d096-41ae-8538-b108becf0970"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/d9844e8a-1437-4aeb-a32c-0c992f056095"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/c9299215-ae47-4f50-9c54-8a392f68a052"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/83cef61d-dbd1-4b20-a4fc-5fbc7da10833"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e802a67a-daf5-4436-9ea6-f6d821dd0c5d"
    parameter_values     = jsonencode({})
  }
}

resource "azurerm_policy_set_definition" "psql" {
  name                = "${var.mg_identification}-psql-pol-set"
  display_name        = "${upper(var.mg_identification)} - PostgreSQL Governance Set"
  policy_type         = "Custom"
  management_group_id = data.azurerm_management_group.ccc.id
  metadata = jsonencode(
    {
      "category" : "Database"
    }
  )
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/fa498b91-8a7e-4710-9578-da944c68d1fe"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4eb5e667-e871-4292-9c5d-8bbb94e0c908"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/d158790f-bfb0-486c-8631-2dc6b4e8e6af"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/c29c38cb-74a7-4505-9a06-e588ab86620a"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/48af4db5-9b8b-401c-8e74-076be876a430"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/cee2f9fd-3968-44be-a863-bd62c9884423"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a43d5475-c569-45ce-a268-28fa79f4e87a"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/12c74c95-0efd-48da-b8d9-2a7d68470c92"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/18adea5e-f416-4d0f-8aa8-d24321e3e274"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/5e1de0e3-42cb-4ebc-a86d-61d0c619ca48"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/b52376f7-9612-48a1-81cd-1ffe4b61032c"
    parameter_values     = jsonencode({})
  }
}

resource "azurerm_policy_set_definition" "sql" {
  name                = "${var.mg_identification}-sql-pol-set"
  display_name        = "${upper(var.mg_identification)} - SQL Governance Set"
  policy_type         = "Custom"
  management_group_id = data.azurerm_management_group.ccc.id
  metadata = jsonencode(
    {
      "category" : "Database"
    }
  )
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a6fb4358-5bf4-4ad7-ba82-2cd2f41ce5e9"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/abfb4388-5bf4-4ad7-ba82-2cd2f41ceae9"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/abfb7388-5bf4-4ad7-ba99-2cd2f41cebb9"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/32e6bbec-16b6-44c2-be37-c5b672d103cf"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/b3a22bc9-66de-45fb-98fa-00f5df42f41a"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0c28c3fb-c244-42d5-a9bf-f35f2999577b"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9dfea752-dd46-4766-aed1-c355fa93fb91"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1b8ca024-1d5c-4dec-8995-b1a932b41780"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a8793640-60f7-487c-b5c3-1d37215905c4"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/ac01ad65-10e5-46df-bdd9-6b0cad13e1d2"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0a370ff3-6cab-4e85-8995-295fd854c5b8"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/17k78e20-9358-41c9-923c-fb736d382a12"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1b7aa243-30e4-4c9e-bca8-d0d3022b634a"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/ef2a8f2a-b3d9-49cd-a8a8-9a3aaaf647d9"
    parameter_values     = jsonencode({})
  }
}

module "mysql_pol" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-mysql-pol"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.mysql_policy_display_name}"
  definition_id                  = azurerm_policy_set_definition.mysql.id
  policy_assignment_location     = var.location
  mg_id                          = data.azurerm_management_group.ccc.id
}

module "psql_pol" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-psql-pol"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.psql_policy_display_name}"
  definition_id                  = azurerm_policy_set_definition.psql.id
  policy_assignment_location     = var.location
  mg_id                          = data.azurerm_management_group.ccc.id
}

module "sql_pol" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-sql-pol"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.sql_policy_display_name}"
  definition_id                  = azurerm_policy_set_definition.sql.id
  policy_assignment_location     = var.location
  mg_id                          = data.azurerm_management_group.ccc.id
}

module "mysql_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.mysql_pol.output_principle_id
}

module "psql_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.psql_pol.output_principle_id
}

module "sql_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.sql_pol.output_principle_id
}