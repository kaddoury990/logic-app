resource "azurerm_logic_app_standard" "logic_app" {
  name                       = var.logic_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.app_service_plan_id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key

  # Site Config
  site_config {
    always_on                    = var.always_on
    app_scale_limit              = var.app_scale_limit
    dotnet_framework_version     = var.dotnet_framework_version
    ftps_state                   = var.ftps_state
    http2_enabled                = var.http2_enabled
    linux_fx_version             = var.linux_fx_version
    min_tls_version              = var.min_tls_version
    pre_warmed_instance_count    = var.pre_warmed_instance_count
    scm_min_tls_version          = var.scm_min_tls_version
    scm_type                     = var.scm_type
    use_32_bit_worker_process    = var.use_32_bit_worker_process
    vnet_route_all_enabled       = var.vnet_route_all_enabled
    websockets_enabled           = var.websockets_enabled

    health_check_path = var.health_check_path
    auto_swap_slot_name = var.auto_swap_slot_name
  }

  # App Settings
  app_settings = merge(
    {
      "FUNCTIONS_WORKER_RUNTIME" = var.FUNCTIONS_WORKER_RUNTIME
    },
    var.app_settings
  )

  # Connection Strings
  dynamic "connection_string" {
    for_each = var.connection_strings
    content {
      name  = connection_string.value.name
      type  = connection_string.value.type
      value = connection_string.value.value
    }
  }

  # Identity
  identity {
    type         = var.identity_type
    identity_ids = var.identity_ids
  }

  # Site Credentials
  dynamic "site_credential" {
    for_each = var.site_credentials != null ? [1] : []
    content {
      username = var.site_credentials.username
      password = var.site_credentials.password
    }
  }

  # Auth Settings
  dynamic "auth_settings" {
    for_each = var.auth_settings_enabled ? [1] : []
    content {
      enabled                        = var.auth_settings_enabled
      additional_login_params        = var.auth_settings_additional_login_params
      allowed_external_redirect_urls = var.auth_settings_allowed_external_redirect_urls
      default_provider               = var.auth_settings_default_provider
      issuer                         = var.auth_settings_issuer
      runtime_version                = var.auth_settings_runtime_version
      token_refresh_extension_hours  = var.auth_settings_token_refresh_extension_hours
      token_store_enabled            = var.auth_settings_token_store_enabled
      unauthenticated_client_action  = var.auth_settings_unauthenticated_client_action

      dynamic "active_directory" {
        for_each = var.auth_settings_active_directory != null ? [1] : []
        content {
          client_id         = var.auth_settings_active_directory.client_id
          client_secret     = var.auth_settings_active_directory.client_secret
          allowed_audiences = var.auth_settings_active_directory.allowed_audiences
        }
      }
    }
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      site_config[0].scm_type
    ]
  }
}
