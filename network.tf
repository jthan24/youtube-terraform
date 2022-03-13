resource "azurerm_network_security_group" "devops-security-group" {
  name                = "devops-security-group"
  location            = azurerm_resource_group.devops-rg.location
  resource_group_name = azurerm_resource_group.devops-rg.name
}



resource "azurerm_virtual_network" "devops-vnet" {
  name                = "devopsVnet"
  location            = local.location
  resource_group_name = azurerm_resource_group.devops-rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "devops-subnet-1"
    address_prefix = "10.0.1.0/24"
  }
  
  tags = local.tags

}

resource "azurerm_subnet" "devops-subnet" {
  name                 = "devops-subnet-2"
  resource_group_name  = azurerm_resource_group.devops-rg.name
  virtual_network_name = azurerm_virtual_network.devops-vnet.name
  address_prefixes     = ["10.0.2.0/24"]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}
