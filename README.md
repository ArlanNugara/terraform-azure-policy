# What is Azure Policy ? [As Per Official Microsoft Article](https://docs.microsoft.com/en-us/azure/governance/policy/overview)

Azure Policy helps to enforce organizational standards and to assess compliance at-scale. Through its compliance dashboard, it provides an aggregated view to evaluate the overall state of the environment, with the ability to drill down to the per-resource, per-policy granularity. It also helps to bring your resources to compliance through bulk remediation for existing resources and automatic remediation for new resources.

Common use cases for Azure Policy include implementing governance for resource consistency, regulatory compliance, security, cost, and management. Policy definitions for these common use cases are already available in your Azure environment as built-ins to help you get started.

All Azure Policy data and objects are encrypted at rest.

More information about Azure Policy can be found [here](https://youtu.be/dxMaYF2GB7o) and [here](https://docs.microsoft.com/en-us/azure/governance/policy/overview)

## Overview

Azure Policy evaluates resources in Azure by comparing the properties of those resources to business rules. These business rules, described in JSON format, are known as policy definitions. To simplify management, several business rules can be grouped together to form a policy initiative (sometimes called a policySet). Once your business rules have been formed, the policy definition or initiative is assigned to any scope of resources that Azure supports, such as management groups, subscriptions, resource groups, or individual resources. The assignment applies to all resources within the Resource Manager scope of that assignment. Subscopes can be excluded, if necessary.

Azure Policy uses a JSON format to form the logic the evaluation uses to determine whether a resource is compliant or not. Definitions include metadata and the policy rule. The defined rule can use functions, parameters, logical operators, conditions, and property aliases to match exactly the scenario you want. The policy rule determines which resources in the scope of the assignment get evaluated.

## Understand evaluation outcomes

Resources are evaluated at specific times during the resource lifecycle, the policy assignment lifecycle, and for regular ongoing compliance evaluation. The following are the times or events that cause a resource to be evaluated:

- A resource is created or updated in a scope with a policy assignment.
- A policy or initiative is newly assigned to a scope.
- A policy or initiative already assigned to a scope is updated.
- During the standard compliance evaluation cycle, which occurs once every 24 hours.

## Control the response to an evaluation

Business rules for handling non-compliant resources vary widely between organizations. Examples of how an organization wants the platform to respond to a non-compliant resource include:

- Deny the resource change
- Log the change to the resource
- Alter the resource before the change
- Alter the resource after the change
- Deploy related compliant resources

Azure Policy makes each of these business responses possible through the application of effects. Effects are set in the policy rule portion of the policy definition.

## Remediate non-compliant resources

While these effects primarily affect a resource when the resource is created or updated, Azure Policy also supports dealing with existing non-compliant resources without needing to alter that resource.

## Azure Policy vs Azure RBAC

There are a few key differences between Azure Policy and Azure role-based access control (Azure RBAC). Azure Policy evaluates state by examining properties on resources that are represented in Resource Manager and properties of some Resource Providers. Azure Policy doesn't restrict actions (also called operations). Azure Policy ensures that resource state is compliant to your business rules without concern for who made the change or who has permission to make a change. Some Azure Policy resources, such as policy definitions, initiative definitions, and assignments, are visible to all users. This design enables transparency to all users and services for what policy rules are set in their environment.

Azure RBAC focuses on managing user actions at different scopes. If control of an action is required, then Azure RBAC is the correct tool to use. Even if an individual has access to perform an action, if the result is a non-compliant resource, Azure Policy still blocks the create or update.

The combination of Azure RBAC and Azure Policy provides full scope control in Azure.

## Azure Policy Objects

### Policy definition

The journey of creating and implementing a policy in Azure Policy begins with creating a policy definition. Every policy definition has conditions under which it's enforced. And, it has a defined effect that takes place if the conditions are met.

### Initiative definition

An initiative definition is a collection of policy definitions that are tailored toward achieving a singular overarching goal. Initiative definitions simplify managing and assigning policy definitions. They simplify by grouping a set of policies as one single item. For example, you could create an initiative titled Enable Monitoring in Microsoft Defender for Cloud, with a goal to monitor all the available security recommendations in your Microsoft Defender for Cloud instance.

### Assignments

An assignment is a policy definition or initiative that has been assigned to a specific scope. This scope could range from a management group to an individual resource. The term scope refers to all the resources, resource groups, subscriptions, or management groups that the definition is assigned to. Assignments are inherited by all child resources. This design means that a definition applied to a resource group is also applied to resources in that resource group. However, you can exclude a subscope from the assignment.

# Going through the Terraform code

The Terraform project is configured to work on the following principle

- The **main.tf** creates the Policy Initiative.
- The modules directory contains a generic policy definition template which every policy files calls.
- The **policies.auto.tfvars** file contains values of all variables defined. You need to exchange **"<Your Value Here>"** with your values or change any values you deemed fit as per your requirement.

## Understanding Policy code

The policy files call the generic module. Here's example of calling the module **allowed_regions**

```
module "allowed_regions_policy" {
  source                         = "./modules/generic_policy_module"
  policy_definition_name         = "${var.org_prefix}${var.allowed_regions_policy_name}"
  policy_definition_display_name = "${var.org_prefix}${var.allowed_regions_policy_display_name}"
  policy_definition_description  = var.allowed_regions_policy_description
  policy_definition_metadata = jsonencode(
    {
      "category" : "${var.allowed_regions_policy_category}"
    }
  )
  policy_definition_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "location",
            "notIn" : "${var.allowed_regions}"
          },
          {
            "field" : "location",
            "notEquals" : "global"
          },
          {
            "field" : "type",
            "notEquals" : "Microsoft.AzureActiveDirectory/b2cDirectories"
          }
        ]
      },
      "then" : {
        "effect" : "${var.allowed_regions_policy_effect}"
      }
    }
  )
}
```

The generic policy module
```
resource "azurerm_policy_definition" "policy" {
  name                = var.policy_definition_name
  display_name        = var.policy_definition_display_name
  description         = var.policy_definition_description
  policy_type         = "Custom"
  mode                = "All"
  management_group_id = var.policy_management_scope
  metadata            = var.policy_definition_metadata
  policy_rule         = var.policy_definition_rule
  parameters          = var.policy_definition_parameters
}
```

The **policy_set_definitions** file creates the policy set definition and adds the policies into the set.

```
resource "azurerm_policy_set_definition" "policy-set-definition" {
  name                = "${var.org_prefix}Baseline Azure Policy Set Definition"
  policy_type         = "Custom"
  display_name        = "${var.org_prefix}Baseline Azure Policy Set Definition"
  management_group_id = var.policy_management_scope

  policy_definition_reference {
    policy_definition_id = module.allowed_regions_policy.policy_id
  }
.........truncated.........
```

The **main.tf** file contains resource block for creating the policy initiative and adds the policy set defintion.

```
resource "azurerm_management_group_policy_assignment" "policy-assignment" {
  name                 = "${var.org_prefix} Policy Initiative"
  policy_definition_id = azurerm_policy_set_definition.policy-set-definition.id
  management_group_id  = var.initiative_management_scope
  description          = "This policy enables a set of definitions that can be deployed."
  display_name         = "${var.org_prefix} Baseline Azure Policy Initiative"
  location             = "canadacentral"
  identity {
    type = "SystemAssigned"
  }
}
```

A glance at the tfvars file

```
// Allowed Regions Policy Details
allowed_regions_policy_name         = "Allowed Azure Regions"
allowed_regions_policy_display_name = "Allowed Azure Regions"
allowed_regions_policy_description  = "This policy allows or audit resources to be created in the specific locations."
allowed_regions_policy_category     = "General"
allowed_regions_policy_effect       = "audit"
```

# Policies that are created

1. Allowed Regions
2. Allowed Resource Types
3. Allowed SQL Version
4. Allowed Storage Account SKU
5. Allowed VM Extensions
6. Allowed Subnets for Public IP
7. Allowed VM OS and version
8. Allowed VM SKU
9. DDOS Protection
10. Diagnostics Settings
11. Diagnostic settings logs to be send to Log Analytics WOrkspace
12. Firewall Internet Traffic
13. Key Vault Purge Protection
14. Key Vault soft delete
15. VM NIC IP Forwarding
16. Enable Network Watchers
17. NSG for every Subnet
18. NSG Inbound rules
19. SQL Database Private endpoint
20. SQL Database TLS version
21. SQL server public network access
22. Storage Account Secure Transfer Settings
23. Storage Account Key Expiry
24. Storage Account Network Access
25. Mandatory Tags
26. Optional Tags
27. Internet facing VM NSG
28. VM managed disk
29. VM management port
30. VM encryption

# Run the code

## Authenticate Azure CLI

Hit the command **az login** from Comamnd Prompt or Terminal depending upon your OS. More details can be found [here](https://docs.microsoft.com/en-us/cli/azure/get-started-with-azure-cli)

## Trigger Manually

Fire the below command to create the resources using Bicep script

> terraform plan
> terraform apply