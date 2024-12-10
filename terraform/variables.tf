variable "azure_region" {
  description = "Azure region for resource deployment"
  default     = "West US"
}

# Node pool counts
variable "default_node_count" {
  description = "Number of nodes in the default node pool"
  default     = 2
}

variable "web_node_count" {
  description = "Number of nodes in the web node pool"
  default     = 1
}

variable "db_node_count" {
  description = "Number of nodes in the database node pool"
  default     = 1
}

# Terraform state configuration
variable "state_storage_rg" {
  description = "Resource group for storing Terraform state"
  default     = "rg-terraform-state"
}

variable "state_storage_account" {
  description = "Storage account name for Terraform state"
  default     = "terraformstateacct"
}

# Azure credentials
variable "subscription_id" {
  description = "Azure subscription ID"
}

variable "tenant_id" {
  description = "Azure tenant ID"
}
