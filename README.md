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

This command will apply the plan from the tfplan file and create the resources mention in the configuration file.

