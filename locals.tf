locals {
  app_settings = {
    WEBSITE_USE_PLACEHOLDER               = var.use_placeholder
    AZURE_LOG_LEVEL                       = var.log_level
    AzureWebJobsDisableHomepage           = var.disable_homepage
    APPLICATIONINSIGHTS_CONNECTION_STRING = var.enable_appinsights ? azurerm_application_insights.this[0].connection_string : null
    APPINSIGHTS_INSTRUMENTATIONKEY        = var.enable_appinsights ? azurerm_application_insights.this[0].instrumentation_key : null
    AzureFunctionsWebHost__hostid         = substr("lapp-${var.project}-${var.env}-${var.location}-${var.name}", -32, -1)
    FUNCTIONS_WORKER_RUNTIME              = var.runtime_version == "~4" ? var.worker_runtime : null
    WEBSITE_NODE_DEFAULT_VERSION          = var.runtime_version == "~4" ? var.node_version : null
  }
}
