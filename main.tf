resource "azurerm_logic_app_standard" "this" {
  name                 = "lapp-${var.project}-${var.env}-${var.location}-${var.name}"
  resource_group_name  = var.resource_group
  location             = var.location
  app_service_plan_id  = var.service_plan_id
  app_settings         = merge(local.app_settings, var.app_settings)
  use_extension_bundle = var.use_extension_bundle
  bundle_version       = var.use_extension_bundle ? var.bundle_version : null
  enabled              = var.enabled
  https_only           = var.https_only
  identity {
    type         = var.identity_ids == null ? "SystemAssigned" : "SystemAssigned, UserAssigned"
    identity_ids = var.identity_ids == null ? [] : var.identity_ids
  }
  storage_account_name       = var.storage_account.name
  storage_account_access_key = var.storage_account.access_key
  version                    = var.runtime_version
  tags                       = var.tags
  site_config {
    always_on                 = var.site_config.always_on
    ftps_state                = var.site_config.ftps_state
    http2_enabled             = var.site_config.http2_enabled
    websockets_enabled        = var.site_config.websockets_enabled
    use_32_bit_worker_process = var.site_config.use_32_bit_worker
    ip_restriction            = var.ip_restriction
    scm_ip_restriction        = var.ip_restriction

  }
  
resource "azurerm_app_service_virtual_network_swift_connection" "this" {
  count          = var.use_private_net ? 1 : 0
  app_service_id = azurerm_logic_app_standard.this.id
  subnet_id      = var.subnet_id
}
