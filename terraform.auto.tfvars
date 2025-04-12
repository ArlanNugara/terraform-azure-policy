// Values

# Shared Resources

location          = "Your value here"
mg_identification = "Your value here" #
mg_id             = "Your value here"
default_tags = {
  "Owner"       = "Arlan Nugara",
  "Department"  = "IT",
  "Environment" = "Shared"
}

# Diagnostics

alllogs_diag_policy_set_def_display_name    = "Deploy Diagnostics Settings for Supported Resources to Log Analytics Workspace"
alllogs_diag_policy_assignment_display_name = "Deploy Diagnostics Settings for Supported Resources to Log Analytics Workspace"
sa_def_set_display_name                     = "Deploy Diagnostics Settings for Storage Accounts to Log Analytics Worspace"
sa_diag_assignment_display_name             = "Deploy Diagnostics Settings for Storage Accounts to Log Analytics Worspace"

# Monitoring

action_group_name                  = "CentralAlertGroup"
action_group_short_name            = "cag"
action_group_email                 = "Your value here"
monitoring_def_set_display_name    = "Deploy Service Health Alert Policy"
monitoring_assignment_display_name = "Deploy Service Health Alert Policy"
grafana_name                       = "grafana-ui"

# VM Insights

vm_insight_assignment_display_name = "VM Insights with Azure Monitoring Agent and Data Collection Rule"

# Change Tracking

# vm_change_tracking_policy_display_name = "VM Change Tracking and Inventory with Azure Monitoring Agent and Data Collection Rule"

# Microsoft Defender

vm_mde_policy_display_name = "VM Microsoft Defender for Endpoint"

# Dependency Agent

vm_dependency_agent_policy_display_name = "VM Dependency Agent"

# Guest Config

vm_guest_config_policy_display_name = "VM Guest Config"

# Iaas Antimalware

vm_iaas_antimalware_policy_display_name = "VM Iaas Antimalware"

# AAD Join

vm_aad_join_policy_display_name = "VM AAD Join"

# General

gen_policy_display_name = "General Governance"
gen_allowed_loc_effect  = "audit"
gen_allowed_loc = [
  "eastus",
  "westus"
]
gen_allowed_res_effect = "audit"
gen_allowed_res = [
  "Microsoft.ApiManagement/*",
  "Microsoft.KeyVault/*",
  "Microsoft.AAD*",
  "Microsoft.AnalysisServices/*",
  "Microsoft.OperationalInsights/*",
  "Microsoft.Synapse/*",
  "Microsoft.Web/*",
  "Microsoft.Network/*",
  "Microsoft.Insights/*",
  "Microsoft.Blueprint/*",
  "Microsoft.Automation/*",
  "Microsoft.RecoveryServices/*",
  "Microsoft.BotService/*",
  "Microsoft.Cdn/*",
  "Microsoft.CognitiveServices/*",
  "Microsoft.AzureArc/*",
  "Microsoft.ContainerInstance/*",
  "Microsoft.ContainerRegistry/*",
  "Microsoft.Storage/*",
  "Microsoft.DocumentDB/*",
  "Microsoft.SecurityInsights/*",
  "Microsoft.Compute/*",
  "Microsoft.DataFactory/*",
  "Microsoft.Sql/*",
  "Microsoft.EventHub/*",
  "Microsoft.Logic/*",
  "Microsoft.Authorization/*",
  "Microsoft.DBforMariaDB/*",
  "Microsoft.DBforMySQL/*",
  "Microsoft.DBforPostgreSQL/*",
  "Microsoft.Cache/*",
  "Microsoft.Resources/*",
  "Microsoft.Search/*",
  "Microsoft.ServiceBus/*",
  "Microsoft.SignalRService/*",
  "Microsoft.Advisor/*",
  "Microsoft.AlertsManagement/*",
  "Microsoft.Dashboard/*",
]

# Network

net_policy_display_name     = "Network Governance"
net_allowed_vnet_pip_effect = "audit"
net_allowed_vnet_pip = [
  "Your value here",
  "Your value here"
]

# Compute

comp_policy_display_name = "Compute Governance"
win_os_version = [
  "2016-Standard",
  "2016-Datacenter",
  "2019-Standard",
  "2019-Datacenter",
  "2022-Standard",
  "2022-Datacenter"
]
lnx_os_version = [
  "7.7",
  "7.8",
  "7.9",
  "8.2",
  "8.3",
  "8.4",
  "8.5",
  "8.5.2111",
  "8.6"
]
comp_allowed_os_effect = "Audit"
comp_allowed_extensions = [
  "AzureMonitorWindowsAgent",
  "AzureMonitorLinuxAgent",
  "AzurePolicyforWindows",
  "AzurePolicyforLinux",
  "ChangeTracking-Windows",
  "ChangeTracking-Linux",
  "DependencyAgentLinux",
  "DependencyAgentWindows",
  "IaaSAntimalware",
  "MDE.Windows",
  "MDE.Linux"
]
comp_allowed_sku = [
  "Standard_B12ms",
  "Standard_B16ms",
  "Standard_B1ms",
  "Standard_B1s",
  "Standard_B2ms",
  "Standard_B2s",
  "Standard_B8as_v2",
  "Standard_B8ms",
  "Standard_D16as_v4",
  "Standard_D16ds_v5",
  "Standard_D16lds_v5",
  "Standard_D2ads_v5",
  "Standard_D2as_v4",
  "Standard_D2as_v5",
  "Standard_D2s_v3",
  "Standard_D32as_v4",
  "Standard_D32ds_v5",
  "Standard_D48ads_v5",
  "Standard_D4as_v4",
  "Standard_D4as_v5",
  "Standard_D4ds_v5",
  "Standard_D4lds_v5",
  "Standard_D4ls_v5",
  "Standard_D4s_v3",
  "Standard_D4s_v4",
  "Standard_D8a_v4",
  "Standard_D8as_v4",
  "Standard_D8lds_v5",
  "Standard_D8s_v3",
  "Standard_DC2s_v2",
  "Standard_DS1_v2",
  "Standard_DS11_v2",
  "Standard_DS12_v2",
  "Standard_DS13_v2",
  "Standard_DS2_v2",
  "Standard_DS3_v2",
  "Standard_E16ads_v5",
  "Standard_E32s_v3",
  "Standard_E4s_v3",
  "Standard_E8-4s_v3",
  "Standard_E8s_v3",
  "Standard_F2s_v2",
  "Standard_F4s_v2"
]
comp_allowed_sku_effect = "Audit"

# Storage

stor_policy_display_name = "Storage Governance"
stor_allowed_sku_effect  = "Audit"
stor_allowed_sku = [
  "Premium_LRS",
  "Premium_ZRS",
  "Standard_GRS",
  "Standard_LRS",
  "Standard_RAGRS",
  "Standard_ZRS"
]

# Tags

req_tags_policy_display_name = "Required Tags Governance"
opt_tags_policy_display_name = "Optional Tags Governance"
req_tags_effect              = "Audit"
opt_tags_effect              = "Audit"
required_tags = [
  "Department",
  "Environment",
  "Owner"
]
optional_tags = [
  "Project",
  "Application",
  "CreatedBy"
]

# Database

mysql_policy_display_name = "MySQL Governance"
psql_policy_display_name  = "PostgreSQL Governance"
sql_policy_display_name   = "SQL Governance"

# Data Factory

adf_max_cores           = 32
adf_policy_display_name = "Data Factory Governance"
adf_linked_service_resource_type = [
  "AdlsGen2CosmosStructuredStream",
  "AdobeExperiencePlatform",
  "AdobeIntegration",
  "AmazonRedshift",
  "AmazonS3",
  "AzureBlobFS",
  "AzureBlobStorage",
  "AzureDataExplorer",
  "AzureDataLakeStore",
  "AzureDataLakeStoreCosmosStructuredStream",
  "AzureDataShare",
  "AzureFileStorage",
  "AzureKeyVault",
  "AzureMariaDB",
  "AzureMySql",
  "AzurePostgreSql",
  "AzureSearch",
  "AzureSqlDatabase",
  "AzureSqlDW",
  "AzureSqlMI",
  "AzureSynapseArtifacts",
  "AzureTableStorage",
  "Cassandra",
  "CommonDataServiceForApps",
  "CosmosDb",
  "CosmosDbMongoDbApi",
  "Db2",
  "DynamicsCrm",
  "FileServer",
  "FtpServer",
  "GitHub",
  "GoogleCloudStorage",
  "Hdfs",
  "Hive",
  "HttpServer",
  "Informix",
  "Kusto",
  "MicrosoftAccess",
  "MySql",
  "Netezza",
  "Odata",
  "Odbc",
  "Office365",
  "Oracle",
  "PostgreSql",
  "Salesforce",
  "SalesforceServiceCloud",
  "SapBw",
  "SapHana",
  "SapOpenHub",
  "SapTable",
  "Sftp",
  "SharePointOnlineList",
  "Snowflake",
  "SqlServer",
  "Sybase",
  "Teradata",
  "HDInsightOnDemand",
  "HDInsight",
  "AzureDataLakeAnalytics",
  "AzureBatch",
  "AzureFunction",
  "AzureML",
  "AzureMLService",
  "MongoDb",
  "GoogleBigQuery",
  "Impala",
  "ServiceNow",
  "Dynamics",
  "AzureDatabricks",
  "AmazonMWS",
  "SapCloudForCustomer",
  "SapEcc",
  "Web",
  "MongoDbAtlas",
  "HBase",
  "Spark",
  "Phoenix",
  "PayPal",
  "Marketo",
  "Responsys",
  "SalesforceMarketingCloud",
  "Presto",
  "Square",
  "Xero",
  "Jira",
  "Magento",
  "Shopify",
  "Concur",
  "Hubspot",
  "Zoho",
  "Eloqua",
  "QuickBooks",
  "Couchbase",
  "Drill",
  "Greenplum",
  "MariaDB",
  "Vertica",
  "MongoDbV2",
  "OracleServiceCloud",
  "GoogleAdWords",
  "RestService",
  "DynamicsAX",
  "AzureDataCatalog",
  "AzureDatabricksDeltaLake"
]

# Databricks

dbw_log_retension_days  = "365"
dbw_policy_display_name = "Databricks Governance"

# Synapse

syn_policy_display_name = "Synapse Governance"