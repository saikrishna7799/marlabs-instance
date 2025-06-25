provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

module "dev_env_vm" {
  source              = "./modules/dev_env_vm"
  dev_username        = var.dev_username
  vm_size             = var.vm_size
  ttl_hours           = var.ttl_hours
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  subnet_id           = module.network.subnet_id
  tags                = var.tags
}