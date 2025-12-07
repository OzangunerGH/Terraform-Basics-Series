variable "vm_name" {
  type = string
}

variable "nic_name" {
  type = string
}

variable "nic_private_ip" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "nsg_name" {
  type = string
}

variable "nsg_allowed_ports" {
  type = list(number)
}
variable "subnet_id" {
  type = string
}
variable "rg_name" {
  type = string
}

variable "rg_location" {
  type = string
}