variable "rg_vnet" {
  type        = string
  description = "Nome do RG"
}

variable "vnet" {
  type        = string
  description = "Nome da VNet"
}

variable "vnet_address_space" {
  type        = string
  description = "VNet - Address Space"
}

variable "cidr_subnet_vpngateway" {
  type    = string
  default = null
}

variable "cidr_subnet_bastion" {
  type    = string
  default = null
}

variable "cidr_subnet_firewall" {
  type    = string
  default = null
}

variable "cidr_subnet_appgateway" {
  type    = string
  default = null
}

variable "nsg1" {
  type        = string
  description = "Nome do NSG1"
  default     = "nsg1"
}

variable "nsg2" {
  type        = string
  description = "Nome do NSG2"
  default     = "nsg2"
}

variable "nsg3" {
  type        = string
  description = "Nome do NSG3"
  default     = "nsg3"
}

variable "dynamicblock-sec-rule-ports" {
  type = list(number)
}