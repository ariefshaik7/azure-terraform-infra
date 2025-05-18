variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for the Virtual Network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the Subnet"
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "Address prefixes for the Subnet"
}

variable "nsg_name" {
  type        = string
  description = "Name of the Network Security Group"
}

variable "public_ip_name" {
  type        = string
  description = "Name of the Public IP address"
}

variable "nic_name" {
  type        = string
  description = "Name of the Network Interface"
}

variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the VM"
}

variable "public_key_path" {
  type        = string
  description = "Path to the SSH public key file"
}

variable "vm_size" {
  type = string
}

variable "computer_name" {
  type = string
}

variable "allocation_method" {
  type = string
}