terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstorageaccttest"
    container_name       = "tfstate-test"
    key                  = "aks-cluster-test.tfstate"
  }
}
