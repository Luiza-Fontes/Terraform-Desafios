resource "azurerm_resource_group" "rg_vnet" {
  name     = var.rg_vnet
  location = "eastus2"
  tags     = local.default_tags
}


resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  resource_group_name = azurerm_resource_group.rg_vnet.name
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.rg_vnet.location
  tags                = local.default_tags
}

resource "azurerm_subnet" "subnets" {
  count                = length(local.subnet_names)
  virtual_network_name = azurerm_virtual_network.vnet.name
  name                 = local.subnet_names[count.index]
  resource_group_name  = azurerm_resource_group.rg_vnet.name
  address_prefixes     = [cidrsubnet(var.vnet_address_space, 8, count.index)]
}


resource "azurerm_network_security_group" "nsgs" {
  count               = length(local.subnet_names)
  name                = "nsg-${local.subnet_names[count.index]}"
  location            = azurerm_resource_group.rg_vnet.location
  resource_group_name = azurerm_resource_group.rg_vnet.name
  tags                = local.default_tags

  dynamic "security_rule" {
    for_each = var.dynamicblock-sec-rule-ports
    content {
      name = "inbound-rule-${security_rule.key}"
      #name                       = "inbound-rule-${security_rule.value}"
      description                = "Inbound Rule ${security_rule.key}"
      priority                   = sum([100, security_rule.key])
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = security_rule.value
      destination_port_range     = security_rule.value
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }

  security_rule {
    name                       = "Outbound-rule-1"
    description                = "Outbound Rule"
    priority                   = 102
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "addnsgs" {
  count                     = length(local.subnet_names)
  subnet_id                 = azurerm_subnet.subnets[count.index].id
  network_security_group_id = azurerm_network_security_group.nsgs[count.index].id
}