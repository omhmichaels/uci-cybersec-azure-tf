
######## INSTANCES: VM_1  ###################

### Network Interface: VM_1 ###


resource "azurerm_public_ip" "redteamip" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}

# Create network interface
resource "azurerm_network_interface" "redteam-vm1-nic" {
  name                    = "vm1NIC"
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  internal_dns_name_label = "jumpbox"


  ip_configuration {
    name                          = "vm1NicConfiguration"
    subnet_id                     = azurerm_subnet.webtier.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.0.4"
    public_ip_address_id          = azurerm_public_ip.redteamip.id

  }

  tags = {
    environment = "Terraform Demo"
  }
}

resource "azurerm_network_interface_security_group_association" "redteam-vm1" {
  network_interface_id      = azurerm_network_interface.redteam-vm1-nic.id
  network_security_group_id = azurerm_network_security_group.redteam-sg.id
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "redteam-vm1" {
  name                  = var.machine1_name
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.redteam-vm1-nic.id]
  size                  = var.machine1_size
  custom_data           = filebase64("files/cloud_init.yml")

  os_disk {
    name                 = "machine1-OsDisk"
    caching              = "ReadWrite"
    storage_account_type = var.machine1_osdisk_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = var.machine1_name
  admin_username                  = var.machine1_adminusername
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.machine1_adminusername
    public_key = file(var.public_key_path_vm1)
  }

  #  boot_diagnostics {
  #    storage_account_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
  #  }

  tags = {
    environment = "Terraform Demo"
  }
}
######################################################

####### INSTANCES: VM_2 #############################
#resource "azurerm_public_ip" "redteamip" {
#  name                = "acceptanceTestPublicIp1"
#  resource_group_name = azurerm_resource_group.rg.name
#  location            = azurerm_resource_group.rg.location
#  allocation_method   = "Static"
#
#  tags = {
#    environment = "Production"
#  }
#}


### Network Interface: VM_2 ###
# Create network interface
resource "azurerm_network_interface" "redteam-vm2-nic" {
  name                    = "vm2NIC"
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  internal_dns_name_label = "dvwa-vm1"


  ip_configuration {
    name                          = "vm2NicConfiguration"
    subnet_id                     = azurerm_subnet.webtier.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.0.6"
    #public_ip_address_id          = azurerm_public_ip.redteamip.id

  }

  tags = {
    environment = "Terraform Demo"
  }
}

resource "azurerm_network_interface_security_group_association" "redteam-vm2" {
  network_interface_id      = azurerm_network_interface.redteam-vm2-nic.id
  network_security_group_id = azurerm_network_security_group.redteam-sg.id
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "redteam-vm2" {
  name                  = var.machine2_name
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.redteam-vm2-nic.id]
  size                  = var.machine1_size
  custom_data           = filebase64("files/dvwa_install.yml")

  os_disk {
    name                 = "machine2-OsDisk"
    caching              = "ReadWrite"
    storage_account_type = var.machine1_osdisk_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = var.machine2_name
  admin_username                  = var.machine2_adminusername
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.machine2_adminusername
    public_key = file(var.public_key_path_vm2)
  }

  #  boot_diagnostics {
  #    storage_account_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
  #  }

  tags = {
    environment = "Terraform Demo"
  }
}
#################################################
