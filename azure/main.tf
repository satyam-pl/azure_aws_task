terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
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
  subscription_id            = "4b3d27d7-ff8a-428b-acaa-856bcf94bba6"
  client_id                  = "5a287d06-d8c1-4d22-845d-6729b2c420e6"
  client_secret              = "5Uz8Q~n30IgLwKr7YmFfv2o.cxmi1V9wtKbWWap6"
  tenant_id                  = "5a97c230-4719-47ba-a5bf-bf343a0926ec"
  skip_provider_registration = true
}

resource "azurerm_resource_group" "example" {
  name     = "azure_aws_task6"
  location = "East Asia"
}

resource "azurerm_service_plan" "example" {
  name                = "free-app-service-plan"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_role_assignment" "example" {
  scope                = azurerm_resource_group.example.id
  role_definition_name = "Contributor"
  principal_id         = "d39ec408-829f-4978-ae48-f3e4a0752c11"  # Replace with the Service Principal's ID
}

resource "azurerm_linux_web_app" "example" {
  name                = "java-aws-azure-my-app-service6"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {}
}
