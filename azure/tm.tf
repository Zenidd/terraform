resource "azurerm_traffic_manager_profile" "tm-fe" {
  name                   = "tm-fe-${var.project_tag_name}-${var.project_tag_environment}"
  resource_group_name    = azurerm_resource_group.rg.name
  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = "tm-fe-${var.project_tag_name}-${var.project_tag_environment}"
    ttl           = 100
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }

  tags = {
    Environment = var.project_tag_environment
    Project = var.project_tag_name
    Team = var.project_tag_team
    CostID = var.project_tag_costid
  }
}

resource "azurerm_traffic_manager_azure_endpoint" "tm-fe-profile" {
  name               = "fe-endpoint"
  profile_id         = azurerm_traffic_manager_profile.tm-fe.id
  weight             = 100
  target_resource_id = azurerm_app_service.webapp-fe.id
}


resource "azurerm_traffic_manager_profile" "tm-be" {
  name                   = "tm-be-${var.project_tag_name}-${var.project_tag_environment}"
  resource_group_name    = azurerm_resource_group.rg.name
  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = "tm-be-${var.project_tag_name}-${var.project_tag_environment}"
    ttl           = 100
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }

  tags = {
    Environment = var.project_tag_environment
    Project = var.project_tag_name
    Team = var.project_tag_team
    CostID = var.project_tag_costid
  }
}

resource "azurerm_traffic_manager_azure_endpoint" "tm-be-profile" {
  name               = "be-endpoint"
  profile_id         = azurerm_traffic_manager_profile.tm-be.id
  weight             = 100
  target_resource_id = azurerm_app_service.webapp-be.id
}


resource "azurerm_traffic_manager_profile" "tm-cms" {
  name                   = "tm-cms-${var.project_tag_name}-${var.project_tag_environment}"
  resource_group_name    = azurerm_resource_group.rg.name
  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = "tm-cms-${var.project_tag_name}-${var.project_tag_environment}"
    ttl           = 100
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }

  tags = {
    Environment = var.project_tag_environment
    Project = var.project_tag_name
    Team = var.project_tag_team
    CostID = var.project_tag_costid
  }
}

resource "azurerm_traffic_manager_azure_endpoint" "tm-cms-profile" {
  name               = "cms-endpoint"
  profile_id         = azurerm_traffic_manager_profile.tm-cms.id
  weight             = 100
  target_resource_id = azurerm_app_service.webapp-cms.id
}
