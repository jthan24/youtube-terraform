resource "azurerm_resource_group" "devops-rg" {
  name     = "devops-resources"
  location = local.location
  tags = local.tags
}