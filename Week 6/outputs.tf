output "web-app-resource-group-name" {
  value = azurerm_resource_group.prod.name
}
output "web-app-private-ip" {
  value = module.vm.web-app-private-ip
}

output "web-app-nsg-name" {
  value = module.vm.web-app-nsg-name
}


output "web-app-nsg-allowed-ports" {
  value = module.vm.web-app-nsg-allowed-ports
}