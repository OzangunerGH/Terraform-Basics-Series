output "web-app-private-ip" {
  value = azurerm_windows_virtual_machine.vm-webapp.private_ip_address 
  }
  
  output "web-app-resource-group-name" {
  value = azurerm_resource_group.prod.name 
  }

  output "web-app-nsg-name" {
  value = azurerm_network_security_group.prod_nsg.name
  }

  
  output "web-app-nsg-allowed-ports" {
  value = var.nsg_allowed_ports
  }