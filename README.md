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


# Resources Deployed

This project mainly focussed on deploying Azure Virtual Machine Extensions, Built-In and Custom Policy using Terraform. The Policy deploys the Extensions in both Windows and Linux systems as well as Azure ARC VMs. Remediation Tasks only works for **DeployIfNotExists** Policy. Existing systems does not automatically remediate, but is remediated using  Policy Remediation Task. Any new system will automatically have the Extensions installed after deployment. 

Here's the list of VM Extensions being deployed using this IaC code.

- **VM Insights with Azure Monitoring Agent and Data Collection Rule**
- **VM Dependency Agent**
- **VM Microsoft Defender for Endpoint**
- **VM Insights with Azure Monitoring Agent and Data Collection Rule for Azure ARC VM**
- **VM Insights with Azure Monitoring Agent and Data Collection Rule for Azure VM**
- **VM Guest Config**
- **VM Iaas Antimalware**

Here's the List of all other Policy that are deployed.

- **Azure Security Benchmark**  
- **CIS Microsoft Azure Foundations Benchmark v1.4.0**  
- **Compute Governance**  
- **Data Factory Governance**  
- **Databricks Governance**  
- **Deploy Diagnostics Settings for Storage Accounts to Log Analytics Workspace**  
- **Deploy Diagnostics Settings for Supported Resources to Log Analytics Workspace**  
- **Deploy Service Health Alert Policy**  
- **General Governance**  
- **MySQL Governance**  
- **Network Governance**  
- **NIST SP 800-53 R5**  
- **Optional Tags Governance**  
- **PostgreSQL Governance**  
- **Required Tags Governance Set**  
- **SQL Governance**  
- **Storage Governance**  
- **Synapse Governance**  

Here are the currently supported OS versions for VM extensions : -

|Publisher  | SKU | Status |
|:--| :--: | :--: |
|Ubuntu | 16.04 | Supported |
|Ubuntu | 18.04 | Supported |
|Ubuntu | 20.04 | Supported |
|Ubuntu | 22.04 | Supported |
|Ubuntu | 24.04 | Not Supported Yet |
|RHEL | 7*  | Supported |
|RHEL | 8*  | **Partially Supported** |
|RHEL | 9*  | Not Supported Yet |
|Windows  | 2016  | Supported |
|Windows  | 2019  | Supported |
|Windows  | 2022  | Supported |
|Windows  | 10  | Supported |

# Prerequisites

The bootstrap Resources include [Key Vault](#key-vault) and [Storage Account](#azure-storage-account). The Key Vault holds sensitive values which are required by Terraform to authenticate with Azure for deployments. The Storage Account holds the TFSTATE file which is required by Terraform to make changes to the Infrastructure. These resources are outside of Terraform deployment and should **not be deleted or altered** unless required. Terraform does not manage these resources and the resources are not deployed or destroyed by Terraform.

## Azure Storage Account

Please create an [Azure Storage Account](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-create?tabs=azure-portal#create-a-storage-account-1) and a [container](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal#create-a-container) named **tfstate** to store Terraform State Files (You may change the name of the container in **providers.tf**). Please note the Service Principle should have access to the Storage Account. Note the [Access Key](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-keys-manage?tabs=azure-portal#view-account-access-keys) for the Storage Account from Azure Portal.

|Key Name|Value|
|:--|:--|
|ARM-ACCESS-KEY|Azure Storage Account Access Key|

**Note** : The details of the Storage Account must be filled in **provider.tf** file [backend configuration](#update-provider-file-with-values).

## Service Connection (For Azure DevOps Pipeline only)

Azure DevOps Pipeline requires Service Connection to run tasks. The Service Principle should have access to Key Vault Secrets ([Get and List Permission](https://learn.microsoft.com/en-us/azure/devops/pipelines/release/azure-key-vault?view=azure-devops&tabs=yaml#set-up-azure-key-vault-access-policies)) to retrieve Key Vault Secret Values required during running the task. Please refer to this [official article](https://learn.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml#create-a-service-connection) for creating the Service Connection from a Service Principle. Note the following values for a Service Principle from Azure Portal.

|Key Name|Value|
|:--|:--|
|ARM-CLIENT-ID|Application ID of the Service Principle|
|ARM-CLIENT-SECRET|Client Secret of the Service Principle|
|ARM-SUBSCRIPTION-ID|Subscription ID of the Key Vault|
|ARM-TENANT-ID|Azure Tenant ID|

## Key Vault (For Azure DevOps Pipeline only)

An Azure Key Vault is required to store Secrets which are used by the pipeline to authenticate against Azure and Azure DevOps to perform its desired operation. Please note the Service Principle mentioned [above](#service-connection) must have **GET** and **LIST** for the Key Vault Secrets. Please [create the secrets](https://learn.microsoft.com/en-us/azure/key-vault/secrets/quick-create-portal#add-a-secret-to-key-vault) in Azure Key Vault. You may refer to the [Service Connection](#service-connection) section for values.

Secrets to be created in Azure Key Vault:

```
ARM-CLIENT-ID
ARM-CLIENT-SECRET
ARM-SUBSCRIPTION-ID
ARM-TENANT-ID
ARM-ACCESS-KEY
```

## Variable Groups (For Azure DevOps Pipeline only)

The code needs an Azure DevOps Pipeline Variable Group linked to an existing Azure Key Vault containing the Secrets. Please refer to this [official article](https://learn.microsoft.com/en-us/azure/devops/pipelines/library/variable-groups?view=azure-devops&tabs=yaml#link-secrets-from-an-azure-key-vault) for more details.

# Going through the Terraform code

The code is simplified to granular level for ease of maintenance and understanding. You may change values as per your convenience.

|Name|Function|
|:--|:--|
|./pipelines/deploy.yaml|Azure DevOps YAML file for Deploy Pipeline|
|./pipelines/destroy.yaml|Azure DevOps YAML file for Destroy Pipeline|
|modules|Terraform code for resources|
|builtin_policy.tf|Terraform code for BuiltIn Azure Policy|
|compute.tf|Terraform code for Compute Governance Policy i.e Virtual Machine Policy|
|data_factory.tf|Terraform code for Data Factory Governance Policy|
|data.tf|Terraform Code for reading existing resources|
|database.tf|Terraform Code for MySQL, PSQL and SQL Governance Policy|
|databricks.tf|Terraform Code for Databricks Governance Policy|
|diagnostics.tf|Terraform Code for Diagnostics Policy|
|general.tf|Terraform Code for General Governance Policy|
|locals.tf|Terraform Local Values of all resources except Core Resources|
|monitoring.tf|Terraform Code for Monitoring Policy|
|network.tf|Terraform Code for Network Governance Policy|
|provider.tf|Terraform Code for provider configuration|
|shared_resources.tf|Main Terraform code for deploying shared resources such as Log Analytics Workspace and Data Collection Endpoints|
|storage.tf|Terraform Code for Storage Governance Policy|
|synapse.tf|Terraform Code for Synapse Governance Policy|
|tags.tf|Terraform Code for Required and Optional Tags Governance Policy|
|terraform.auto.tfvars|Terraform Code for providing variable values in run time|
|variables.tf|Terraform Variables for Resources |
|vm_aad_join.tf|Terraform Code for Active Directory Join VM Extension|
|vm_change_tracking_arc.tf|Terraform Code for Change Tracking and Inventory Extension for Azure ARC VM|
|vm_change_tracking.tf|Terraform Code for Change Tracking VM Extension for General VM|
|vm_dependency_agent.tf|Terraform Code for Dependency Agent VM Extension|
|vm_guest.tf|Terraform Code for VM Guest Configuration Extension|
|vm_iaas_antimalware.tf|Terraform Code for IaaS Antimalware VM Extension|
|vm_insights_arc.tf|Terraform Code for Monitoring Agent Insights Extension for Azure ARC VM|
|vm_insights.tf| Terraform code for Monitoring Agent Insights Extensions for General VM|
|vm_mde.tf|Terraform Code for Microsoft Defender for Endpoint VM Extension|

## Updating Pipeline YAML file with values

Once done with all the [above steps](#prerequisites) update the both the yaml files inside **.pipelines** folder in the repository.

```
variables:
  - name: AZURE_SERVICE_CONNECTION
    value: '< SERVICE CONNECTION NAME >'
  - group: '< VARIABLE GROUP NAME LINKED TO KEY VAULT >'
```

## Update Provider file with values

You need to update **provider.tf** file with values for the [Azure Storage Account](#azure-storage-account) which will host the Terraform State file.

```
-- Output Cut --
backend "azurerm" {
  resource_group_name  = "Your value here"
  storage_account_name = "Your value here"
  container_name       = "Your value here"
  key                  = "Your value here"
}
-- Output Cut --
```

## Update values in tfvars file

You need to update the values in **terraform.auto.tfvars** file. Update the values as per your organization.

# Run the code

## Apply Manually

Hit the command **az login** from Comamnd Prompt or Terminal depending upon your OS. More details can be found [here](https://docs.microsoft.com/en-us/cli/azure/get-started-with-azure-cli)

Fire the below command to create the resources using Bicep script

> terraform plan

> terraform apply

## Apply from Azure DevOps Pipeline

### Creating Deploy Pipeline

Please follow this instruction to create the deploy pipeline

- Go to **Pipelines** in Azure DevOps
- Click on **New Pipeline** from right top corner
- Select **Azure Repos Git**
- Select your repository containing this code
- Select **Existing Azure Pipelines YAML file**
- Select the branch and select path as **/.pipelines/deploy.yaml**
- Click on **Continue**
- Click on **Save** from **Run** drop down menu on top right corner
- You may rename the pipeline by choosing **Rename/move** from top right corner Kebab menu

### Running the Deploy Pipeline

Please follow the instruction to run deploy pipelines

- Go to **Pipelines** in Azure DevOps and select the [pipeline](#creating-deploy-pipeline) created above.

- Click on **Run Pipeline** from top right corner

- Select **Apply Option** as **No** and click on **Run** button

- Follow the Pipeline Status

**Recommended:** It is recommended to keep **Apply Option** as **No** for first time. Once satisfied with the Terraform Plan output you need to rerun the Pipeline keeping **Apply Option** as **Yes**.

## Destroying the Infrastructure (Optional)

### Creating Destroy Pipeline

Please follow this instruction to create the destroy pipeline

- Go to **Pipelines** in Azure DevOps
- Click on **New Pipeline** from right top corner
- Select **Azure Repos Git**
- Select your repository containing this code
- Select **Existing Azure Pipelines YAML file**
- Select the branch and select path as **/.pipelines/destroy.yaml**
- Click on **Continue**
- Click on **Save** from **Run** drop down menu on top right corner
- You may rename the pipeline by choosing **Rename/move** from top right corner Kebab menu

### Running the Destroy Pipeline

Please follow the instruction to run destroy pipelines

- Go to **Pipelines** in Azure DevOps and select the [pipeline](#creating-destroy-pipeline) created above.

- Click on **Run Pipeline** from top right corner

- Select **Apply Option** as **No** and click on **Run** button

- Follow the Pipeline Status

**Recommended:** It is recommended to keep **Apply Option** as **No** for first time. Once satisfied with the Terraform Plan output you need to rerun the Pipeline keeping **Apply Option** as **Yes**.
