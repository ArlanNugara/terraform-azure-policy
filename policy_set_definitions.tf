resource "azurerm_policy_set_definition" "policy-set-definition" {
  name         = "${var.client}-Baseline Azure Policy Set Definition"
  policy_type  = "Custom"
  display_name = "${var.client}-Baseline Azure Policy Set Definition"

  policy_definition_reference {
    policy_definition_id = module.am2_storage_accounts_should_be_migrated_to_new_azure_resource_manager_resources_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.am2_virtual_machines_should_be_migrated_to_new_azure_resource_manager_resources_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.br1_azure_backup_should_be_enabled_for_virtual_machines_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_mariadb_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_mysql_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_postgresql_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.br2_azure_backup_should_be_enabled_for_virtual_machines_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_mariadb_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_mysql_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_postgresql_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp2_azure_defender_for_azure_sql_database_servers_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp2_azure_defender_for_open_source_relational_databases_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp2_azure_defender_for_sql_servers_on_machines_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp2_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp2_azure_defender_for_storage_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp3_api_app_should_only_be_accessible_over_https_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp3_ftps_only_should_be_required_in_your_function_app_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp3_function_app_should_only_be_accessible_over_https_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp3_kubernetes_clusters_should_be_accessible_only_over_https_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp3_windows_web_servers_should_be_configured_to_use_secure_communication_protocols_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp4_automation_account_variables_should_be_encrypted_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp4_service_fabric_clusters_should_have_the_clusterprotectionlevel_property_set_to_encryptandsign_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp4_transparent_data_encryption_on_sql_databases_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp4_virtual_machines_should_encrypt_temp_disks__caches__and_data_flows_between_compute_and_storage_resources_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp5_azure_cosmos_db_accounts_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp5_azure_machine_learning_workspaces_should_be_encrypted_with_a_customer_managed_key_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp5_container_registries_should_be_encrypted_with_a_customer_managed_key_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp5_mysql_servers_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp5_storage_accounts_should_use_customer_managed_key_for_encryption_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp6_key_vault_keys_should_have_an_expiration_date_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp6_key_vault_secrets_should_have_an_expiration_date_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp7_certificates_should_have_the_specified_maximum_validity_period_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp8_azure_defender_for_key_vault_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp8_azure_key_vault_should_disable_public_network_access_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp8_key_vaults_should_have_purge_protection_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp8_key_vaults_should_have_soft_delete_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.dp8_resource_logs_in_key_vault_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.es1_azure_defender_for_servers_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.es2_endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.es2_endpoint_protection_should_be_installed_on_your_machines_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.es2_endpoint_protection_solution_should_be_installed_on_virtual_machine_scale_sets_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.es2_windows_defender_exploit_guard_should_be_enabled_on_your_machines_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.es3_endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.im1_an_azure_active_directory_administrator_should_be_provisioned_for_sql_servers_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.im1_service_fabric_clusters_should_only_use_azure_active_directory_for_client_authentication_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.im3_managed_identity_should_be_used_in_your_api_app_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.im3_managed_identity_should_be_used_in_your_function_app_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.im3_managed_identity_should_be_used_in_your_web_app_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.im3_virtual_machines_guest_configuration_extension_should_be_deployed_with_system_assigned_managed_identity_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.im6_authentication_to_linux_machines_should_require_ssh_keys_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.im6_mfa_should_be_enabled_accounts_with_write_permissions_on_your_subscription_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.im6_mfa_should_be_enabled_on_accounts_with_owner_permissions_on_your_subscription_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.im6_mfa_should_be_enabled_on_accounts_with_read_permissions_on_your_subscription_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ir2_email_notification_for_high_severity_alerts_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ir2_email_notification_to_subscription_owner_for_high_severity_alerts_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ir2_subscriptions_should_have_a_contact_email_address_for_security_issues_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ir3_azure_defender_for_dns_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ir3_azure_defender_for_key_vault_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ir3_azure_defender_for_open_source_relational_databases_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ir3_azure_defender_for_resource_manager_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ir3_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ir4_network_watcher_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ir5_azure_defender_for_dns_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ir5_azure_defender_for_key_vault_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ir5_azure_defender_for_open_source_relational_databases_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ir5_azure_defender_for_resource_manager_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ir5_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt1_azure_defender_for_dns_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt1_azure_defender_for_key_vault_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt1_azure_defender_for_open_source_relational_databases_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt1_azure_defender_for_resource_manager_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt1_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt2_azure_defender_for_dns_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt2_azure_defender_for_key_vault_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt2_azure_defender_for_open_source_relational_databases_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt2_azure_defender_for_resource_manager_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt2_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt3_resource_logs_in_azure_data_lake_store_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt3_resource_logs_in_azure_stream_analytics_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt3_resource_logs_in_data_lake_analytics_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt3_resource_logs_in_search_services_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt3_resource_logs_in_service_bus_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt5_auto_provisioning_of_the_log_analytics_agent_should_be_enabled_on_your_subscription_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt5_linux_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt5_log_analytics_agent_should_be_installed_on_your_virtual_machine_for_azure_security_center_monitoring_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt5_log_analytics_agent_should_be_installed_on_your_virtual_machine_scale_sets_for_azure_security_center_monitoring_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt5_windows_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.lt6_sql_servers_with_auditing_to_storage_account_destination_should_be_configured_with_90_days_retention_or_higher_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns10_azure_defender_for_dns_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns1_adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns1_all_network_ports_should_be_restricted_on_network_security_groups_associated_to_your_virtual_machine_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns1_internet_facing_virtual_machines_should_be_protected_with_network_security_groups_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns1_non_internet_facing_virtual_machines_should_be_protected_with_network_security_groups_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns1_subnets_should_be_associated_with_a_network_security_group_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns2_cognitive_services_accounts_should_restrict_network_access_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns2_storage_accounts_should_restrict_network_access_using_virtual_network_rules_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns2_storage_accounts_should_use_private_link_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns2_storage_account_public_access_should_be_disallowed_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns2_vm_image_builder_templates_should_use_private_link_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns3_all_internet_traffic_should_be_routed_via_your_deployed_azure_firewall_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns3_ip_forwarding_on_your_virtual_machine_should_be_disabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns3_management_ports_of_virtual_machines_should_be_protected_with_just_in_time_network_access_control_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns3_management_ports_should_be_closed_on_your_virtual_machines_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns5_azure_ddos_protection_standard_should_be_enabled_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns6_azure_web_application_firewall_should_be_enabled_for_azure_front_door_entry_points_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns6_web_application_firewall_waf_should_be_enabled_for_application_gateway_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns7_adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns8_latest_tls_version_should_be_used_in_your_api_app_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns8_latest_tls_version_should_be_used_in_your_function_app_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.ns8_latest_tls_version_should_be_used_in_your_web_app_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pa1_a_maximum_of_3_owners_should_be_designated_for_your_subscription_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pa1_deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pa1_external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pa1_there_should_be_more_than_one_owner_assigned_to_your_subscription_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pa2_management_ports_of_virtual_machines_should_be_protected_with_just_in_time_network_access_control_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pa4_deprecated_accounts_should_be_removed_from_your_subscription_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pa4_deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pa4_external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pa4_external_accounts_with_read_permissions_should_be_removed_from_your_subscription_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pa4_external_accounts_with_write_permissions_should_be_removed_from_your_subscription_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pa7_role_based_access_control_rbac_should_be_used_on_kubernetes_services_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pv2_cors_should_not_allow_every_resource_to_access_your_api_app_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pv2_cors_should_not_allow_every_resource_to_access_your_web_applications_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pv2_kubernetes_clusters_should_not_use_the_default_namespace_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pv2_kubernetes_cluster_pods_should_only_use_approved_host_network_and_port_range_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pv2_kubernetes_cluster_pod_hostpath_volumes_should_only_use_allowed_host_paths_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pv4_guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pv4_guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_scale_sets_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pv4_guest_attestation_extension_should_be_installed_on_supported_windows_virtual_machines_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pv4_vtpm_should_be_enabled_on_supported_virtual_machines_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pv4_windows_machines_should_meet_requirements_of_the_azure_compute_security_baseline_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pv5_a_vulnerability_assessment_solution_should_be_enabled_on_your_virtual_machines_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pv5_vulnerability_assessment_should_be_enabled_on_sql_managed_instance_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pv5_vulnerability_assessment_should_be_enabled_on_your_sql_servers_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pv6_container_registry_images_should_have_vulnerability_findings_resolved_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pv6_ensure_that_java_version_is_the_latest__if_used_as_a_part_of_the_function_app_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pv6_ensure_that_python_version_is_the_latest__if_used_as_a_part_of_the_api_app_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pv6_ensure_that_python_version_is_the_latest__if_used_as_a_part_of_the_web_app_policy.policy_id
  }

  policy_definition_reference {
    policy_definition_id = module.pv6_sql_servers_on_machines_should_have_vulnerability_findings_resolved_policy.policy_id
  }
}