module "ns2_vm_image_builder_templates_should_use_private_link_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.client}-VM Image Builder templates should use private link"
  policy_definition_display_name = "${var.client}-VM Image Builder templates should use private link"
  policy_definition_description  = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your VM Image Builder building resources, data leakage risks are reduced. Learn more about private links at: https://docs.microsoft.com/azure/virtual-machines/linux/image-builder-networking#deploy-using-an-existing-vnet."
  policy_definition_metadata = jsonencode(
    {
      "category" : "VM Image Builder"
    }
  )

  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.VirtualMachineImages/imageTemplates"
          },
          {
            "field" : "Microsoft.VirtualMachineImages/imageTemplates/vmProfile.vnetConfig",
            "exists" : "false"
          }
        ]
      },
      "then" : {
        "effect" : "Audit"
      }
    }
  )
}
