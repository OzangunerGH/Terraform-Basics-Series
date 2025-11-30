resource "azurerm_network_security_group" "prod_nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.prod.location
  resource_group_name = azurerm_resource_group.prod.name

  dynamic "security_rule" {
    for_each = var.nsg_allowed_ports

    content {
      name                       = "allow-port-${security_rule.value}"
      priority                   = 100 + (index(var.nsg_allowed_ports, security_rule.value) * 100)
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value
      source_address_prefix      = "10.0.6.0/24"
      destination_address_prefix = "*"
    }
  }
}

resource "azurerm_network_interface_security_group_association" "vm_nic_nsg" {
  network_interface_id      = azurerm_network_interface.nic-webapp.id
  network_security_group_id = azurerm_network_security_group.prod_nsg.id
}