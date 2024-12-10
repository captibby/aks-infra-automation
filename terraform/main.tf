# Configure the Azure provider
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

# Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-aks-test"
  location = var.azure_region
}

# Create an AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-cluster-test"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-dns-test"

  default_node_pool {
    name       = "default"
    node_count = var.default_node_count
    vm_size    = "Standard_B2s"
    node_labels = {
      "environment" = "default"
    }
  }

    lifecycle {
    ignore_changes = [
      default_node_pool[0].upgrade_settings
    ]
  }

  identity {
    type = "SystemAssigned"
  }
}

# Create Additional Node Pool 1 (web)
resource "azurerm_kubernetes_cluster_node_pool" "web" {
  name                  = "web"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  node_count            = var.web_node_count
  vm_size               = "Standard_B2s"
  node_labels = {
    "purpose" = "web"
  }
}

# Create Additional Node Pool 2 (db)
resource "azurerm_kubernetes_cluster_node_pool" "db" {
  name                  = "db"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  node_count            = var.db_node_count
  vm_size               = "Standard_B2s"
  node_labels = {
    "purpose" = "database"
  }
}
