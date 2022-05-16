output "failure_wb_id" {
  
  value = jsondecode(azurerm_resource_group_template_deployment.Failure_Analysis.output_content).workbookId.value

}