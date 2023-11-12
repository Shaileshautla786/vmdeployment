Before initiating deployment of any virtual machine, we need to review or change default value for all resource variables in Vm_variable.tf file as per existing name on Azure portal as it is under "".

1) Vnet
2) Subnet
3) Resource Group
4) Location
5) admin username
6) admin Password
7) Vm size

Example like below:

variable "ResourceGroup" {
    description = "resource group name"
    type = string
    default = "rg-weu-prod"
}

Likewise we need to change or review default values for existing vnet & subnet; username & password; vm_sizes, location etc.

After above done we can initiate terraform and deployement by following below commands one by one.

1) Terraform Init  (This command is used to initialize a working directory containing terraform config files.)

2) Terraform plan  (This command shows the configuration changes are going to apply when its applied by 3rd command for review. it helps in review the changes.)

3) Terraform apply  (This command execute and deploys the resources as mentioned in main.tf file)

4) Terraform destroy (This command will delete the deployed resources)


2:46 am to 2:51 am --- 6 minutes to create
2:53 am to 3:01 am -- 9 minutes
