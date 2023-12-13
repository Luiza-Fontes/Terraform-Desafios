variable "rg" {
  type        = string
  description = "Nome do grupo de recurso"
}


variable "rgforeach" {
  type        = list(string)
  description = "Nome do grupo de recurso para testar o for_each"
}


variable "rgcount" {
  type        = list(string)
  description = "Nome do grupo de recurso para testar o count"
}


variable "rg-tf-conditions" {
  type        = string
  description = "Nome do grupo de recurso para testar conditions"
}

variable "cria-rg" {
  type = bool
}

variable "dynamicblock-sec-rule-ports" {
  type = list(number)
}

variable "prefix" {
  default     = "estudostf"
  type        = string
  description = "xxxxxx xxx xxx xx"
}


variable "vnet1" {
  type        = string
  description = "Nome da Vnet1"
}


variable "vnet2" {
  type        = string
  description = "Nome da Vnet2"
}


variable "nsg1" {
  type        = string
  description = "Nome do NSG1"
}


variable "nsg2" {
  type        = string
  description = "Nome do NSG2"
}


variable "subnet1vnet1" {
  type        = string
  description = "Nome da subnet1 da Vnet1"
}


variable "subnet1vnet2" {
  type        = string
  description = "Nome da subnet1 da Vnet2"
}

variable "subnet2vnet1" {
  type        = string
  description = "Nome da subnet2 da Vnet1"
}


variable "subnet2vnet2" {
  type        = string
  description = "Nome da subnet2 da Vnet2"
}


variable "peer1to2" {
  type        = string
  description = "Nome Peering vnt1 x vnet2"
}


variable "peer2to1" {
  type        = string
  description = "Nome Peering vnt2 x vnet2"
}