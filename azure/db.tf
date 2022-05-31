resource "azurerm_sql_server" "sql_server" {
  name                         = "newsnowsqlserver"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"

  tags = {
    Environment = var.project_tag_environment
    Project = var.project_tag_name
    Team = var.project_tag_team
    CostID = var.project_tag_costid
  }
}

resource "azurerm_sql_database" "sql_db" {
  name                = "newsnowsqldb"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sql_server.name

  tags = {
    Environment = var.project_tag_environment
    Project = var.project_tag_name
    Team = var.project_tag_team
    CostID = var.project_tag_costid
  }
}