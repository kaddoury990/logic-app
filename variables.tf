# Resource Group Variables
variable "resource_group_name" {
  description = "The name of the resource group where resources will be deployed"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
  default     = "West Europe"
}

# Logic App Standard Variables
variable "logic_app_name" {
  description = "The name of the Logic App Standard instance"
  type        = string
}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan to use for the Logic App"
  type        = string
}

# Storage Account Variables
variable "storage_account_name" {
  description = "The name of the storage account to use for the Logic App"
  type        = string
}

variable "storage_account_access_key" {
  description = "The access key for the storage account"
  type        = string
  sensitive   = true
}

# App Service Configuration Variables
variable "always_on" {
  description = "Should the Logic App be always on"
  type        = bool
  default     = false
}

variable "app_scale_limit" {
  description = "The maximum number of workers for the Logic App"
  type        = number
  default     = 1
}

variable "use_32_bit_worker_process" {
  description = "Should the Logic App run in 32-bit worker process"
  type        = bool
  default     = false
}

variable "websockets_enabled" {
  description = "Should WebSockets be enabled"
  type        = bool
  default     = false
}

variable "linux_fx_version" {
  description = "Linux FX version for the app service"
  type        = string
  default     = "DOCKER|mcr.microsoft.com/azure-functions/dotnet:4-appservice-quickstart"
}

variable "health_check_path" {
  description = "The path to health check endpoint"
  type        = string
  default     = null
}

# Site Config Variables
variable "dotnet_framework_version" {
  description = "The version of .NET framework to use"
  type        = string
  default     = "v6.0"
}

variable "ftps_state" {
  description = "State of FTP/S for the app service"
  type        = string
  default     = "FtpsOnly"
}

variable "http2_enabled" {
  description = "Should HTTP/2 be enabled"
  type        = bool
  default     = false
}

variable "min_tls_version" {
  description = "Minimum TLS version for the app service"
  type        = string
  default     = "1.2"
}

variable "pre_warmed_instance_count" {
  description = "Number of pre-warmed instances"
  type        = number
  default     = 1
}

variable "scm_min_tls_version" {
  description = "Minimum TLS version for SCM"
  type        = string
  default     = "1.2"
}

variable "scm_type" {
  description = "SCM type for the app service"
  type        = string
  default     = "None"
}

variable "vnet_route_all_enabled" {
  description = "Should all outbound traffic be routed through VNet"
  type        = bool
  default     = false
}

# App Settings Variables
variable "app_settings" {
  description = "Application settings for the Logic App"
  type        = map(string)
  default     = {}
}

variable "FUNCTIONS_WORKER_RUNTIME" {
  description = "Functions worker runtime"
  type        = string
  default     = "dotnet"
}

# Connection String Variables
variable "connection_strings" {
  description = "Connection strings for the Logic App"
  type = list(object({
    name  = string
    type  = string
    value = string
  }))
  default = []
}

# Identity Variables
variable "identity_type" {
  description = "Type of managed identity to assign. Possible values: SystemAssigned, UserAssigned, SystemAssigned, UserAssigned"
  type        = string
  default     = null
}

variable "identity_ids" {
  description = "List of User Assigned Identity IDs when identity_type includes UserAssigned"
  type        = list(string)
  default     = []
}

# Site Credentials Variables
variable "site_credentials" {
  description = "Site credentials (username/password) for the Logic App"
  type = object({
    username = string
    password = string
  })
  sensitive = true
  default   = null
}

# Tags Variables
variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

# Site Config Auto Swap
variable "auto_swap_slot_name" {
  description = "Auto swap slot name"
  type        = string
  default     = null
}

# Auth Settings Variables
variable "auth_settings_enabled" {
  description = "Should Authentication/Authorization be enabled"
  type        = bool
  default     = false
}

variable "auth_settings_additional_login_params" {
  description = "Additional login parameters for auth settings"
  type        = map(string)
  default     = {}
}

variable "auth_settings_allowed_external_redirect_urls" {
  description = "Allowed external redirect URLs for auth settings"
  type        = list(string)
  default     = []
}

variable "auth_settings_default_provider" {
  description = "Default authentication provider"
  type        = string
  default     = null
}

variable "auth_settings_issuer" {
  description = "Authentication issuer"
  type        = string
  default     = null
}

variable "auth_settings_runtime_version" {
  description = "Runtime version for authentication"
  type        = string
  default     = null
}

variable "auth_settings_token_refresh_extension_hours" {
  description = "Token refresh extension hours"
  type        = number
  default     = null
}

variable "auth_settings_token_store_enabled" {
  description = "Should token store be enabled"
  type        = bool
  default     = null
}

variable "auth_settings_unauthenticated_client_action" {
  description = "Action to take for unauthenticated clients"
  type        = string
  default     = null
}

# Auth Settings Active Directory
variable "auth_settings_active_directory" {
  description = "Active Directory authentication settings"
  type = object({
    client_id         = string
    client_secret     = string
    allowed_audiences = list(string)
  })
  sensitive = true
  default   = null
}
