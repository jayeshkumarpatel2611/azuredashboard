terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.5.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "#{backend_resource_group}#"
    storage_account_name = "#{backend_storage_account}#"
    container_name       = "#{backend_container_name}#"
    key                  = "#{backend_tfstate_file_name}#"
    
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_subscription" "current" {}


module "Performance_Analysis" {
  
  source = "./modules/Azure-workbooks/Performance_Analysis"

  location                  = var.location
  resource_group_name       = var.resource_group_name
  AppInsights               = var.AppInsights
  subscription_id           = data.azurerm_subscription.current.subscription_id
  environment_name          = var.environment_name
  client_name               = var.client_name
  idn_tenant_id             = var.idn_tenant_id
  env_code                  = var.env_code
  DashboardRG               = var.DashboardRG

}

module "Failure_Analysis" {
  
  source = "./modules/Azure-workbooks/Failure_Analysis"

  location                  = var.location
  resource_group_name       = var.resource_group_name
  AppInsights               = var.AppInsights
  subscription_id           = data.azurerm_subscription.current.subscription_id
  environment_name          = var.environment_name
  client_name               = var.client_name
  idn_tenant_id             = var.idn_tenant_id
  env_code                  = var.env_code
  DashboardRG               = var.DashboardRG

}

module "Usage_Analysis" {
  
  source = "./modules/Azure-workbooks/Usage_Analysis"

  location                  = var.location
  resource_group_name       = var.resource_group_name
  AppInsights               = var.AppInsights
  subscription_id           = data.azurerm_subscription.current.subscription_id
  environment_name          = var.environment_name
  client_name               = var.client_name
  idn_tenant_id             = var.idn_tenant_id
  env_code                  = var.env_code
  DashboardRG               = var.DashboardRG

}


module "Azure-dashboard" {
  
  source = "./modules/Azure-dashboard"

  location                  = var.location
  resource_group_name       = var.resource_group_name
  AppInsights               = var.AppInsights
  subscription_id           = data.azurerm_subscription.current.subscription_id
  environment_name          = var.environment_name
  client_name               = var.client_name
  idn_tenant_id             = var.idn_tenant_id
  env_code                  = var.env_code
  DashboardRG               = var.DashboardRG
  subscription_name         = data.azurerm_subscription.current.display_name
  
  Performance_workbookId    = module.Performance_Analysis.perf_wb_id
  Failure_workbookId        = module.Failure_Analysis.failure_wb_id
  Usage_workbookId          = module.Usage_Analysis.usage_wb_id

  depends_on = [
    module.Performance_Analysis,
    module.Failure_Analysis,
    module.Usage_Analysis
  ]

}
