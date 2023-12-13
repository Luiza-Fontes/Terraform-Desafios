# Configuração do provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state-dev"
    storage_account_name = "tfstateestudosdev"
    container_name       = "tfstateestudosdev"
    key                  = "terraform.tfstate"
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

# Cria o grupo de recursos do projeto
resource "azurerm_resource_group" "rg" {
  name     = var.rg
  location = "eastus2"
}


resource "azurerm_resource_group" "rg-foreach" {
  for_each = toset(var.rgforeach)
  name     = each.key
  location = "eastus2"
}


resource "azurerm_resource_group" "rg-count" {
  count    = length(var.rgcount)
  name     = var.rgcount[count.index]
  location = "eastus2"
}

resource "azurerm_resource_group" "rg-tf-conditions" {
  name     = var.rg-tf-conditions
  location = "eastus2"
}


# Identificação randomica
resource "random_string" "random" {
  length  = 5
  special = false
  upper   = false
}