### GENERAL CONFIG ###

# Safe SSH IP
variable "my_ip_address" {
  description = "My Ip Address"
}

# Region
variable "location" {
  description = "Region of Deploy"
}

# Resource Group Name
variable "resource_group_name" {
  description = "Azure Resource Group"
  default     = "az_resource_group"
}

### VIRTUAL MACHINES: ###

# VM: Jumpbox
variable "machine1_size" {
  description = "Machine Size"
}

variable "machine1_name" {
  description = "Machine Name"
}

variable "machine1_osdisk_type" {
  description = "Os Disk Type"
}

variable "machine1_adminusername" {
  description = "Admin Username"
}

variable "machine1_custom_data" {
  description = "Custom Data"
}

variable "public_key_path_vm1" {
  description = "Public Key path 1"

}

# VM: DVWA 
variable "machine2_size" {
  description = "Machine Size 2"
}
variable "machine2_name" {
  description = "Machine Name 2"
}
variable "machine2_osdisk_type" {
  description = "Os Disk type 2"
}
variable "machine2_adminusername" {
  description = "Admin Username 2"
}

variable "machine2_custom_data" {
  description = "Machine 2 Custom Data"
}

variable "public_key_path_vm2" {
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

