variable "vnet_name" {
  description = "Name of the Azure Virtual Network"
  type        = string
}

variable "address_space" {
  description = "Address space of the Virtual Network"
  type        = list(string)
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the existing Resource Group"
  type        = string
}

variable "tags" {
  description = "Tags applied to Azure resources"
  type        = map(string)
  default     = {}
}