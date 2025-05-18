variable "vm_name" {
  description = "Name of the virtual machine"
  type = string 
}

variable "vm_size" {
  description = "Size of the VM (e.g., Standard_B1s)"
  type = string 
}

variable "location" {
  type = string 
}

variable "resource_group_name" {
  type = string 
}

variable "computer_name" {
  description = "Hostname of the VM"
  type = string 
}

variable "admin_username" {
  type = string 
}

variable "public_key_path" {
  description = "Path to your SSH public key file"
  type = string 
}

variable "network_interface_id" {
  description = "ID of the network interface to attach to the VM"
  type        = string
}
