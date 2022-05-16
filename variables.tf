# Variables Declaration

variable "resource_group_name" {

type = string

description = "Az Resource group name"

}

variable "location" {

type = string

description = "Az Resource location"

}

variable "AppInsights" {

    type = string

    description = "Application Insights Name"
  
}

variable "subscription_id" {
  
  type = string
  description = "Subscription Id"
}

variable "idn_tenant_id" {
  description = "IDN Tenant ID"
  type        = string
}

variable "environment_name" {
  description = "Environment Name"
  type        = string
}

variable "client_name" {
  description = "Client Name"
  type        = string
}

variable "env_code" {
  description = "Environment Code"
  type        = string
}

variable "backend_resource_group" {
    description = "Name of Backend ResourceGroup"
    type = string
}

variable "backend_storage_account" {
    description = "Name of Storage Account"
    type = string
}

variable "backend_container_name" {
    description = "Name of Storage Container"
    type = string
}

variable "backend_tfstate_file_name" {
    description = "Name of Storage Container"
    type = string
}
