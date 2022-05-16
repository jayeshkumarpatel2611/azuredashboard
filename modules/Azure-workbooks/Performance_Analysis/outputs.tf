output "perf_wb_id" {
  
  value = jsondecode(azurerm_resource_group_template_deployment.Performance_Analysis.output_content).workbookId.value

}