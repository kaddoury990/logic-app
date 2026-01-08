output "logic_app_id" {
  description = "The ID of the Logic App Standard"
  value       = azurerm_logic_app_standard.logic_app.id
}

output "logic_app_name" {
  description = "The name of the Logic App Standard"
  value       = azurerm_logic_app_standard.logic_app.name
}

output "logic_app_default_hostname" {
  description = "The default hostname of the Logic App"
  value       = azurerm_logic_app_standard.logic_app.default_hostname
}

output "logic_app_outbound_ip_addresses" {
  description = "Outbound IP addresses of the Logic App"
  value       = azurerm_logic_app_standard.logic_app.outbound_ip_addresses
}

output "logic_app_possible_outbound_ip_addresses" {
  description = "Possible outbound IP addresses of the Logic App"
  value       = azurerm_logic_app_standard.logic_app.possible_outbound_ip_addresses
}

output "logic_app_identity" {
  description = "Managed identity of the Logic App"
  value       = azurerm_logic_app_standard.logic_app.identity
  sensitive   = true
}

output "logic_app_site_credentials" {
  description = "Site credentials of the Logic App"
  value       = azurerm_logic_app_standard.logic_app.site_credential
  sensitive   = true
}
