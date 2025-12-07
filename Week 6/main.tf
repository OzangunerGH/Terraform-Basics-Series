module "vm" {
  source            = "./modules/vm"
  rg_name           = var.rg_name
  rg_location       = var.rg_location
  subnet_id         = azurerm_subnet.prod.id
  vm_name           = var.vm_name
  nic_name          = var.nic_name
  nic_private_ip    = var.nic_private_ip
  vm_size           = var.vm_size
  admin_username    = var.admin_username
  admin_password    = var.admin_password
  nsg_name          = var.nsg_name
  nsg_allowed_ports = var.nsg_allowed_ports


}