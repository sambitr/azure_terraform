variable "storage_account_name" {
    type=string
	default="sambitkumarroutstaccount"
}

variable "resource_group_name" {
    type=string
	default="testresourcegroup"
}

provider "azurerm" {
    version = "~> 2.1.0"
	subscription_id = "9c656139-c543-4a08-b5bc-2d6515b3fe92"
	tenant_id = "57ef91bd-a765-4445-983e-c41eb7182fb0"
	features{}
}

resource "azurerm_resource_group" "grp" {
	name = var.resource_group_name
	location = "North Europe"
}

resource "azurerm_storage_account" "store" {
	name 					 = var.storage_account_name
	resource_group_name 	 = azurerm_resource_group.grp.name
	location 				 = azurerm_resource_group.grp.location
	account_tier             = "Standard"
	account_replication_type = "LRS"
}

