# Azure Workbook Deployment - Performance_Analysis_AllIn

resource "azurerm_resource_group_template_deployment" "Performance_Analysis" {

  name                = "Performance_Analysis"

  resource_group_name = var.resource_group_name

  template_content    = file("${path.module}/Performance_Analysis.json")

  parameters_content  = jsonencode({

    "workbookName" = {
      value = "poh-${var.env_code}-${var.idn_tenant_id}-${var.client_name}-${var.environment_name}-performance-Analysis-wbk"
    }

    "Application_Insights" = {
      value = var.AppInsights
    }

    "Subscription_Id" = {
      value = var.subscription_id
    }

    "ResourceGroup" = {
      value = var.resource_group_name
    }
    
    "DashboardRG" = {  
      value = var.DashboardRG    
    }

    "Location" = {
      value = var.location
    }

  })

  deployment_mode = "Incremental"
}
