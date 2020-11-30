variable "storage_account_name" {
    type=string
	default="sambitkumarroutstaccount"
}

variable "network_name" {
    type=string
	default="staging"
}

variable "vm_name" {
    type=string
	default="stagingvm"
}

provider "azurerm" {
    version = "~> 2.1.0"
	subscription_id = "9c656139-c543-4a08-b5bc-2d6515b3fe92"
	tenant_id = "57ef91bd-a765-4445-983e-c41eb7182fb0"
	features{}
}

resource "azure_virtual_network" "staging" {
	name = var.network_name
	address_space = "[10.0.0.0/16]"
	location = "North Europe"
	resource_group_name = "testresourcegroup"
}

resource "azure_subnet" "default" {
	name = "default"
	resource_group_name = "testresourcegroup"
	virtual_network_name = azure_virtual_network.staging.name
	address_space = "[10.0.0.0/24]"
}

resource "azure_network_interface" "interface" {
	name = "default_interface"
	resource_group_name = "testresourcegroup"
	location = "North Europe"
	
	ip_configuration {
		name = "interfaceconfiguration"
		subnet_id = azure_subnet.default.id
		private_ip_address_allocation = "Dynamic"	
	}
}

resource "azure_virtual_machine" "vm" {
	name = var.vm_name
	location = "North Europe"
	resource_group_name = "testresourcegroup"
	network_interface_ids = azure_network_interface.interface.id
	vm_size = "Standard_DS1_v2"
	
	storage_image_preference {
		publisher = "Canonical"
		offer = "UbuntuServer"
		sku = "18.04-LTS"
		version = "latest"
	}
	
	storage_os_disk {
		name = "osdisk1"
		caching = "ReadWrite"
		create_option = "FromImage"
		managed_disk_type = "StandardLRS"
	}
	
	os_profile {
		computer_name = var.vm_name
		admin_username = "sambit"
		admin_password = "SambitStagingVM#23"
	}
}



resource "azurerm_storage_account" "store" {
	name 					 = var.storage_account_name
	resource_group_name 	 = azurerm_resource_group.grp.name
	location 				 = azurerm_resource_group.grp.location
	account_tier             = "Standard"
	account_replication_type = "LRS"
}

