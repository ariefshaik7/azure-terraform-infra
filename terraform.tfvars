location = "centralindia"

resource_group_name = "rg-demo"

vnet_name          = "vnet-demo"
vnet_address_space = ["10.0.0.0/16"]

subnet_name             = "subnet-demo"
subnet_address_prefixes = ["10.0.1.0/24"]

nsg_name = "nsg-demo"

public_ip_name    = "public-ip-demo"
allocation_method = "Dynamic"

nic_name = "nic-demo"

vm_name         = "vm-demo"
vm_size         = "Standard_B1ls"
computer_name   = "vm-host"
admin_username  = "azureuser"
public_key_path = "~/.ssh/id_rsa.pub"
