variable "nic_name" {
  type = string 
}

variable "location" {
  type = string 
}

variable "resource_group_name" {
  type = string 
}

variable "subnet_id" {
  type = string 
}

variable "public_ip_id" {
  description = "ID of the public IP to attach to NIC"
  type        = string
}
