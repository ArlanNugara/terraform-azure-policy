module "ns1_subnets_should_be_associated_with_a_network_security_group_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-Subnets should be associated with a Network Security Group"
  policy_definition_display_name = "${var.client}-Subnets should be associated with a Network Security Group"
  policy_definition_description  = "Protect your subnet from potential threats by restricting access to it with a Network Security Group (NSG). NSGs contain a list of Access Control List (ACL) rules that allow or deny network traffic to your subnet."
  policy_definition_metadata = jsonencode(
    {
      "category" : "Security Center"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "field" : "type",
        "equals" : "Microsoft.Network/virtualNetworks/subnets"
      },
      "then" : {
        "effect" : "AuditIfNotExists",
        "details" : {
          "type" : "Microsoft.Security/assessments",
          "name" : "eade5b56-eefd-444f-95c8-23f29e5d93cb",
          "existenceCondition" : {
            "field" : "Microsoft.Security/assessments/status.code",
            "in" : [
              "NotApplicable",
              "Healthy"
            ]
          }
        }
      }
    }
  )
}
