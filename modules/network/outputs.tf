output "vnet_id" {
  description = "ID of the Azure Virtual Network"
  value       = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "Name of the Azure Virtual Network"
  value       = azurerm_virtual_network.this.name
}