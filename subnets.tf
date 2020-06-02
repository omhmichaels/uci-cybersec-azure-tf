########## SUBNETS ###################

### Web Tier Subnet ###
resource "azurerm_subnet" "webtier" {
  name                 = "web_tier"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.subnet_webtier
}

resource "azurerm_subnet" "accounting" {
  name                 = "accounting"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.subnet_accounting
}

resource "azurerm_subnet" "hr" {
  name                 = "hr"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.subnet_hr
}

resource "azurerm_subnet" "finance" {
  name                 = "finance"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.subnet_finance
}
