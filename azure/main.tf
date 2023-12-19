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
   client_id             = "c6632e3a-7468-45be-8356-c77ae9b19ef7"
    client_secret         = "kwD8Q~dV_-Cr7ul2jtt2dN4mvBDAY03GwUTRCcJl"
    tenant_id             = "f05e717f-ceec-435e-8143-d88720bab0be"
    subscription_id       = "594f8c5b-b47f-4e30-8adc-56b83869fcb9"
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
