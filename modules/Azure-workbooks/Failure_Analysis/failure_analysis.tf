# Azure Workbook Deployment - Failure_Analysis_AllIn

resource "azurerm_resource_group_template_deployment" "Failure_Analysis" {

  name                = "Failure_Analysis"

  resource_group_name = ${var.resource_group_name}

  template_content    = file("${path.module}/Failure_Analysis.json")

  parameters_content  = jsonencode({

    "workbookName" = {
      value = "poh-${var.env_code}-${var.idn_tenant_id}-${var.client_name}-${var.environment_name}-failure-Analysis-wbk"
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

    "Location" = {
      value = var.location
    }

  })

  deployment_mode = "Incremental"
}
