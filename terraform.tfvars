### CONFIGURABLE OPTIONS ###
# RESOURCE GROUP NAME 
#resource_group_name = ""

# SSH SAFE IP's
#my_ip_address = ""

# ADVANCED: BE CAREFUL IF CHANGING #
# REGION
location = "westus2"


### VIRTUAL NETWORK CONFIG ### 
# Network Cidr
vnet_cidr = "10.0.0.0/16"


# Subnets
subnet_webtier    = ["10.0.0.0/24"]
subnet_accounting = ["10.0.1.0/24"]
subnet_hr         = ["10.0.2.0/24"]
subnet_finance    = ["10.0.3.0/24"]


### VM: JUMPBOX ###
## CONFIGURABLE OPTIONS ##
vm1_root_user = "somhmone"
vm1_name          = "somhmbox"

## ADVANCED: WARING CHANGE AT OWN RISK ##
vm1_size          = "Standard_B1s"
vm1_osdisk_type   = "Premium_LRS"
vm1_public_key_path    = "~/.ssh/azure-jumpbox.pub"
vm1_custom_data   = "$(base64 cloud_init.yml)"

### VM: DVWA ###
vm2_adminusername = "somhmone"
vm2_name          = "dvwa"
vm2_osdisk_type   = "Premium_LRS"
vm2_size          = "Standard_B1s"
vm2_public_key_path   = "~/.ssh/azure-dvwa.pub"
vm2_custom_data   = "$(base64 cloud_init.yml)"

