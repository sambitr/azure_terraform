# azure_terraform

### Commands:

```
terraform init
```

The above command will initiate the terraform platform. It will look for the config file(.tf) and download the provider mentioned in it.

```
terraform plan -out <planname>.tfplan
```

This will create a terraform plan out of the terraform config(.tf) file and store in <planname>.tfplan file name. The .tf file, which is a config file, is now converted in to a .tfplan file, which will be used by terraform to plan the resources in Azure.
  
```
terraform apply <planname>.tfplan
```

This command will apply the plan from the tfplan file and create the resources mention in the configuration file, like below:

```
sambit@Azure:~$ terraform apply storage.tfplan
azurerm_resource_group.grp: Creating...
azurerm_resource_group.grp: Creation complete after 2s [id=/subscriptions/9c656139-c543-4a08-b5bc-2d6515b3fe92/resourceGroups/testresourcegroup]
azurerm_storage_account.store: Creating...
azurerm_storage_account.store: Still creating... [10s elapsed]
azurerm_storage_account.store: Still creating... [20s elapsed]
azurerm_storage_account.store: Creation complete after 29s [id=/subscriptions/9c656139-c543-4a08-b5bc-2d6515b3fe92/resourceGroups/testresourcegroup/providers/Microsoft.Storage/storageAccounts/sambitkumarroutstaccount]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate
sambit@Azure:~$
```

