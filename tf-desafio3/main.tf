# Configuração do provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.44.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state-dev"
    storage_account_name = "tfstateestudosdev"
    container_name       = "tfstateestudosdev"
    key                  = "terraform.tfstate"
  }

  # required_version = ">= 1.1.0"
}

provider "azurerm" {
  #subscription_id = var.subscription_id
  features {
    key_vault {
      purge_soft_deleted_keys_on_destroy = true
      recover_soft_deleted_keys          = true
    }
  }
}

# Cria o grupo de recursos do projeto
resource "azurerm_resource_group" "rg" {
  name     = var.rg
  location = "eastus2"
}


# Chamada Módulo VNET
module "az-modulo-vnet" {
  source                      = "./modulos/az-modulo-vnet"
  rg_vnet                     = "rg-vnet"
  vnet                        = "vnet-estudostf"
  vnet_address_space          = "10.0.0.0/16"
  dynamicblock-sec-rule-ports = [22, 80, 8080, 8081, 7080, 7081]
}


module "az-modulo-vnet2" {
  source                      = "./modulos/az-modulo-vnet"
  rg_vnet                     = "rg-vnet2"
  vnet                        = "vnet-estudostf-2"
  vnet_address_space          = "10.1.0.0/16"
  dynamicblock-sec-rule-ports = [3389, 22, 9090]
}

# Saídas do módulo VNET
output "network_account_id" {
  value = module.az-modulo-vnet.address_spaces
}


# Chamada Módulo Mensagem
module "tf-modulo-enviar-msg" {
  source   = "./modulos/tf-modulo-enviar-msg"
  mensagem = "Teste Terraform - Trabalhando com Módulos"
}

# Saídas do módulo VNET
output "mensagem" {
  value = module.tf-modulo-enviar-msg.mensagem
}