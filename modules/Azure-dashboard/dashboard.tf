# Azure Dashboard Deployment

data "template_file" "json-template" {
  template = file("${path.module}/azure_dashboard.json")
  vars = {
    subscription_id           = var.subscription_id,
    resourcegroup             = var.resource_group_name,
    AppInsights               = var.AppInsights,
    location                  = var.location
    perf_analysis_workbook    = var.Performance_workbookId
    failure_analysis_workbook = var.Failure_workbookId
    usage_analysis_workbook   = var.Usage_workbookId
  }
}

resource "azurerm_portal_dashboard" "my-dashboard" {
  name                 = "poh-${var.env_code}-${var.idn_tenant_id}-${var.client_name}-${var.environment_name}-dash"
  resource_group_name = var.DashboardRG
  location             = var.location
  dashboard_properties = data.template_file.json-template.rendered
}
