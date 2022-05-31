resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "webapp-asp-${var.project_tag_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "Free"
    size = "F1"
  }

  tags = {
    Environment = var.project_tag_environment
    Project = var.project_tag_name
    Team = var.project_tag_team
    CostID = var.project_tag_costid
  }
}

resource "azurerm_app_service" "webapp-fe" {
  name                = "webapp-fe-${var.project_tag_name}-${var.project_tag_environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id

  source_control {
    repo_url           = "https://github.com/Azure-Samples/nodejs-docs-hello-world"
    branch             = "master"
    manual_integration = true
    use_mercurial      = false
  }

  tags = {
    Environment = var.project_tag_environment
    Project = var.project_tag_name
    Team = var.project_tag_team
    CostID = var.project_tag_costid
  }
}


resource "azurerm_app_service" "webapp-be" {
  name                = "webapp-be-${var.project_tag_name}-${var.project_tag_environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id

  source_control {
    repo_url           = "https://github.com/Azure-Samples/nodejs-docs-hello-world"
    branch             = "master"
    manual_integration = true
    use_mercurial      = false
  }

  tags = {
    Environment = var.project_tag_environment
    Project = var.project_tag_name
    Team = var.project_tag_team
    CostID = var.project_tag_costid
  }
}


resource "azurerm_app_service" "webapp-cms" {
  name                = "webapp-cms-${var.project_tag_name}-${var.project_tag_environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id

  source_control {
    repo_url           = "https://github.com/Azure-Samples/nodejs-docs-hello-world"
    branch             = "master"
    manual_integration = true
    use_mercurial      = false
  }

  tags = {
    Environment = var.project_tag_environment
    Project = var.project_tag_name
    Team = var.project_tag_team
    CostID = var.project_tag_costid
  }
}
