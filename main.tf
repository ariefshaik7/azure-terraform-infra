module "resource_group" {
  source              = "./modules/resource-group"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "virtual_network" {
  source               = "./modules/virtual-network"
  virtual_network_name = var.vnet_name
  address_space        = var.vnet_address_space
  location             = var.location
  resource_group_name  = module.resource_group.name
}

module "subnet" {
  source               = "./modules/subnet"
  subnet_name          = var.subnet_name
  address_prefixes     = var.subnet_address_prefixes
  virtual_network_name = module.virtual_network.name
  resource_group_name  = module.resource_group.name
}

module "nsg" {
  source              = "./modules/nsg"
  nsg_name            = var.nsg_name
  location            = var.location
  resource_group_name = module.resource_group.name
}

module "public_ip" {
  source              = "./modules/public_ip"
  public_ip_name      = var.public_ip_name
  location            = var.location
  resource_group_name = module.resource_group.name
  allocation_method   = var.allocation_method
}

module "nic" {
  source              = "./modules/nic"
  nic_name            = var.nic_name
  location            = var.location
  resource_group_name = module.resource_group.name
  subnet_id           = module.subnet.id
  public_ip_id = module.public_ip.id
}

module "virtual_machine" {
  source              = "./modules/virtual-machine"
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  location            = var.location
  computer_name       = var.computer_name
  resource_group_name = module.resource_group.name
  admin_username      = var.admin_username
  public_key_path     = file(var.public_key_path)
  network_interface_id = module.nic.id
}
