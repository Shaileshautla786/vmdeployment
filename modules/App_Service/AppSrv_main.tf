provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "AppSrv" {
  name = var.azurerm_resource_group
}


resource "azurerm_app_service_plan" "example_plan" {
  name                = "${var.app_service_name}-plan"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.AppSrv.name
  sku {
    tier = var.tier
    size = var.size
  }
}

resource "azurerm_app_service" "example_app_service" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.AppSrv.name
  app_service_plan_id = azurerm_app_service_plan.example_plan.id

  site_config {
    dotnet_framework_version = "v5.0"
  }

  app_settings = {
    "APP_SETTING_KEY" = "APP_SETTING_VALUE"
  }

  connection_string {
    name  = "MyDatabase"
    type  = "SQLServer"
    value = "Server=myserver;User Id=myuser;Password=mypassword;Database=mydb;"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}