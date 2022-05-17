variable "DashboardRG" {

type = string

description = "Resource group name for Dashboard"

}

variable "resource_group_name" {

type = string

description = "Az Resource group name"

}

variable "Performance_workbookId" {
  
type = string

description = "Azure Performance_workbookId"

}

variable "Failure_workbookId" {

type = string

description = "Azure Failure_workbookId"
  
}
# Variables Declaration

variable "Usage_workbookId" {

type = string

description = "Azure Usage_workbookId"
  
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

variable "subscription_name" {
  
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
