output "usage_wb_id" {
    
    value = jsondecode(azurerm_resource_group_template_deployment.Usage_Analysis.output_content).workbookId.value
     
}