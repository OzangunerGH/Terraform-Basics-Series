resource "azurerm_network_interface" "nic-webapp" {
  name                = var.nic_name
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.nic_private_ip
  }
}

resource "azurerm_windows_virtual_machine" "vm-webapp" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic-webapp.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2025-Datacenter-g2"
    version   = "latest"
  }
}

resource "azurerm_network_security_group" "prod_nsg" {
  name                = var.nsg_name
  location            = var.rg_location
  resource_group_name = var.rg_name

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