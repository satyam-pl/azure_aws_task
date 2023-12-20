
# Authenticate using Service Principal credentials
provider "azurerm" {
  features {}
  subscription_id            = "4b3d27d7-ff8a-428b-acaa-856bcf94bba6"
  client_id                  = "5a287d06-d8c1-4d22-845d-6729b2c420e6"
  client_secret              = "5Uz8Q~n30IgLwKr7YmFfv2o.cxmi1V9wtKbWWap6"
  tenant_id                  = "5a97c230-4719-47ba-a5bf-bf343a0926ec"
}

# Define the resource group
resource "azurerm_resource_group" "example" {
  name     = "myResourceGroup"
  location = "East US"  # Replace with your preferred Azure region
}

# Define the app service plan
resource "azurerm_app_service_plan" "example" {
  name                = "myAppServicePlan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Basic"  # You can choose from Free, Shared, Basic, Standard, Premium, Isolated tiers
    size = "B1"     # Replace with the size you need within the chosen tier
  }
}

# Define the web app service
resource "azurerm_app_service" "example" {
  name                = "myWebAppService987"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    # Define web app configurations here if needed
  }
}

