resource "azurerm_resource_group" "dev" {
  name     = "rg-enterprise-dev"
  location = "northeurope"

  tags = {
    environment = "dev"
    project     = "azure-terraform-enterprise-lab"
    managed_by  = "terraform"
  }
}

module "network" {
  source = "../../modules/network"

  vnet_name           = "vnet-enterprise-dev"
  address_space       = ["10.20.0.0/16"]
  location            = azurerm_resource_group.dev.location
  resource_group_name = azurerm_resource_group.dev.name

  tags = {
    environment = "dev"
    project     = "azure-terraform-enterprise-lab"
    managed_by  = "terraform"
  }
}