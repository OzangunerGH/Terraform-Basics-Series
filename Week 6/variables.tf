variable "admin_username" {
  description = "Administrator username for the VM"
  type        = string
  default     = "azureuser"
}
variable "admin_password" {
  description = "Administrator password for the VM"
  type        = string
  sensitive   = true
}
variable "rg_name" {
  description = "Name Variable for Resource Group"
  type        = string
  default     = "rg-prod-001"
}

variable "vm_name" {
  description = "Administrator password for the VM"
  type        = string
  default     = "webapp-prod-001"
}

variable "nic_name" {
  description = "Name variable for NIC of VM"
  type        = string
  default     = "nic-webapp-prod-001"
}

variable "vnet_name" {
  description = "Name Variable for the Virtual Network"
  type        = string
  default     = "vnet-prod-001"
}
variable "subnet_name" {
  description = "Name Variable for the Subnet"
  type        = string
  default     = "subnet-prod-001"
}

variable "nic_private_ip" {
  description = "Private IP variable for NIC of VM"
  type        = string
  default     = "10.0.2.10"
}
variable "vm_size" {
  description = "SKU variable for the VM"
  type        = string
  default     = "Standard_L2aos_v4"
}
variable "rg_location" {
  description = "Location Variable for Resource Group"
  type        = string
  default     = "East US"
}

variable "nsg_allowed_ports" {
  type = list(number)

}

variable "nsg_name" {
  type = string
}