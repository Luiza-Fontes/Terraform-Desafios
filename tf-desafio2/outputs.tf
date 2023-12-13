output "vnet1" {
  value = azurerm_virtual_network.vnet1.name
}


output "subnet1vnet" {
  value = azurerm_virtual_network.vnet1.subnet
}


output "vm-info-nome" {
  value = azurerm_virtual_machine.vm.name
}


output "vm-info-ip" {
  value = azurerm_network_interface.nic.private_ip_address
}


output "rg-foreach" {
  value = azurerm_resource_group.rg-foreach
}


output "rg-count" {
  value = azurerm_resource_group.rg-foreach
}

