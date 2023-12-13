locals {
  subnet_names = ["AppGatewaySubnet", "FirewallSubnet", "VMsSubnet"]
  default_tags = {
    deployedby = "terraform"
    provider   = "azure                "
    type       = "network"
  }
}