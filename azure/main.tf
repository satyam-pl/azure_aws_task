terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.0"
    }
  }
 
   backend "remote" {
     organization = "satyam-patel-trident"
     workspaces {
       name = "azure_aws_task"
     }
   }
}
 
provider "azurerm" {
  features {}
  subscription_id = "4b3d27d7-ff8a-428b-acaa-856bcf94bba6"
  client_id       = "5a287d06-d8c1-4d22-845d-6729b2c420e6"
  client_secret   = "5Uz8Q~n30IgLwKr7YmFfv2o.cxmi1V9wtKbWWap6"
  tenant_id       = "5a97c230-4719-47ba-a5bf-bf343a0926ec"
  # Use skip_provider_registration to bypass automatic registration
  skip_provider_registration = true
}
 
resource "azurerm_resource_group" "example" {
  name     = "azure_aws_task6"
  location = "East Asia"
}
 
resource "azurerm_service_plan" "example" {
  name                = "free-app-service-plan"  # Define your App Service Plan name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type = "Linux"
  sku_name ="S1"
 
}
 
resource "azurerm_app_service" "example" {
  name                = "java-aws-azure-my-app-service6"  # Define your App Service name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_service_plan.example.id  # Reference the App Service Plan ID
}
has context menu
