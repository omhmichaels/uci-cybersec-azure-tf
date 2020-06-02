### GENERAL CONFIG ###
# REGION
location = "westus2"

# RESOURCE GROUP NAME 
resource_group_name = "somhm_awesome"

# SSH SAFE IP's
my_ip_address = ""


### VIRTUAL NETWORK CONFIG ### 
# Network Cidr
vnet_cidr = "10.0.0.0/16"


# Subnets
subnet_webtier    = ["10.0.0.0/24"]
subnet_accounting = ["10.0.1.0/24"]
subnet_hr         = ["10.0.2.0/24"]
subnet_finance    = ["10.0.3.0/24"]


#machine1_size="Standard_B1ls"
machine1_size          = "Standard_B1s"
machine1_name          = "Jump-Box-Provisioner"
machine1_osdisk_type   = "Premium_LRS"
machine1_adminusername = "red_team"
public_key_path_vm1    = "~/.ssh/azure_terraform.pub"
machine1_custom_data   = "$(base64 cloud_init.yml)"

#machine2_size="Standard_B1ls"
machine2_size          = "Standard_B1s"
machine2_name          = "DVWA-VM1"
machine2_osdisk_type   = "Premium_LRS"
machine2_adminusername = "red_team"
public_key_path_vm2    = "~/.ssh/azure_terraform.pub"
machine2_custom_data   = "$(base64 cloud_init.yml)"

