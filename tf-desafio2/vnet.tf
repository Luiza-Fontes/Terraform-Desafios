resource "azurerm_network_security_group" "nsg1" {
  name                = var.nsg1
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

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
  tags = {
    ambiente = "Estudos Terraform"
  }
}

/*resource "azurerm_network_security_rule" "nsg1-rule1" {
  name                        = "HTTP"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg1.name
}*/

resource "azurerm_network_security_group" "nsg2" {
  name                = var.nsg2
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

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

  tags = {
    ambiente = "Estudos Terraform"
  }
}


/*resource "azurerm_network_security_rule" "nsg2-rule1" {
  name                        = "RDP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg2.name
}


resource "azurerm_network_security_rule" "nsg2-rule2" {
  name                        = "SSH"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg2.name
}*/


resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet1
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]


  tags = {
    ambiente = "Estudos Terraform"
  }

  depends_on = [
    azurerm_resource_group.rg
  ]
}

# Cria a subnet
resource "azurerm_subnet" "subnet1vnet1" {
  name                 = var.subnet1vnet1
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [
    azurerm_virtual_network.vnet1
  ]
}

resource "azurerm_subnet" "subnet2vnet1" {
  name                 = var.subnet2vnet1
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "addnsg1" {
  subnet_id                 = azurerm_subnet.subnet1vnet1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}

resource "azurerm_virtual_network" "vnet2" {
  name                = var.vnet2
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.10.0.0/16"]
  dns_servers         = ["10.10.0.4", "10.10.0.5"]

  tags = {
    ambiente = "Estudos Terraform"
  }

  depends_on = [
    azurerm_resource_group.rg
  ]
}

# Cria a subnet
resource "azurerm_subnet" "subnet1vnet2" {
  name                 = var.subnet1vnet2
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = ["10.10.1.0/24"]

  depends_on = [
    azurerm_virtual_network.vnet2
  ]
}

resource "azurerm_subnet" "subnet2vnet2" {
  name                 = var.subnet2vnet2
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = ["10.10.2.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "addnsg2" {
  subnet_id                 = azurerm_subnet.subnet1vnet2.id
  network_security_group_id = azurerm_network_security_group.nsg2.id
}

# Cria peering
resource "azurerm_virtual_network_peering" "peer1to2" {
  name                      = var.peer1to2
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id = azurerm_virtual_network.vnet2.id
}

resource "azurerm_virtual_network_peering" "peer2to1" {
  name                      = var.peer2to1
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet2.name
  remote_virtual_network_id = azurerm_virtual_network.vnet1.id
}