
# Authenticate using Service Principal credentials
provider "azurerm" {
  features {}
  subscription_id            = "4b3d27d7-ff8a-428b-acaa-856bcf94bba6"
  client_id                  = "ce6fc630-ca7a-4041-a380-6d80c5d78ebf"
  client_secret              = "s0A8Q~MWROMoz9sO5DM~My3GuQpgEHE4K1_AuaYx"
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

