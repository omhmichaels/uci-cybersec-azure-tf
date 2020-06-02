### GENERAL CONFIG ###

## CONFIGURABLE OPTIONS ##
#  Safe SSH IP
variable "my_ip_address" {
  description = "My Ip Address"
}

# Resource Group Name
variable "resource_group_name" {
  description = "Azure Resource Group"
}


# ADVANCED: BE CAREFUL IF CHANF #
# Region
variable "location" {
  description = "Region of Deploy"
}
###



### VIRTUAL MACHINES: ###

# VM: Jumpbox
variable "vm1_size" {
  description = "Machine Size"
}

variable "vm1_name" {
  description = "Machine Name"
}

variable "vm1_osdisk_type" {
  description = "Os Disk Type"
}

variable "vm1_root_user" {
  description = "Admin Username"
}

variable "vm1_custom_data" {
  description = "Custom Data"
}

variable "vm1_public_key_path" {
  description = "Public Key path 1"

}

# VM: DVWA 
variable "vm2_size" {
  description = "Machine Size 2"
}
variable "vm2_name" {
  description = "Machine Name 2"
}
variable "vm2_osdisk_type" {
  description = "Os Disk type 2"
}
variable "vm2_adminusername" {
  description = "Admin Username 2"
}

variable "vm2_custom_data" {
  description = "Machine 2 Custom Data"
}

variable "vm2_public_key_path" {
  description = "Public Key path 2"
}


### VIRTUAL NETWORK ###

# Vnet
variable "vnet_cidr" {
  description = "Base Network Cidr"
}

# Subnets 
variable "subnet_accounting" {
  description = "Subnet Accounting"
}

variable "subnet_hr" {
  description = "Subnet HR"
}

variable "subnet_webtier" {
  description = "Subnet Finance Webtier"
}

variable "subnet_finance" {
  description = "Subnet Finance"
}

