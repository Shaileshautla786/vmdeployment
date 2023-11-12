*********************************************************************************************************

                               ░██╗░░░░░░░██╗███████╗██╗░░░░░░█████╗░░█████╗░███╗░░░███╗███████╗
                               ░██║░░██╗░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔════╝
                               ░╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░╚═╝██║░░██║██╔████╔██║█████╗░░
                               ░░████╔═████║░██╔══╝░░██║░░░░░██║░░██╗██║░░██║██║╚██╔╝██║██╔══╝░░
                               ░░╚██╔╝░╚██╔╝░███████╗███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║███████╗
                               ░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝
*********************************************************************************************************
*********************************************************************************************************

1) Terraform init - This command is to be used at the initial changes so that any added providers configurations can be loaded in the repo.

2) Terraform plan to be used to review the changes.

3) Please use below commands as it is to deploy each resource or use Terraform apply directly deploy    all resources at once:
*********************************************************************************************************

Deploy command for each resource:
*********************************************************************************************************

To deploy Virtual Machine:
terraform apply -target="module.vm_deployement"

To deploy Storage Account:
terraform apply -target="module.Storage_Account"

To deploy App Service:
terraform apply -target="module.App_Service"

To deploy Nsg rule in existing NSG inbound or outbound defined in direction variable value in nsg_variables.tf:

terraform apply -target="module.nsg_rule"

To deploy Application Gateway:
terraform apply -target="module.Application_Gateway"

To deploy Load Balancer Standard:
terraform apply -target="module.load_balancer"

To deploy Net App Volume:
terraform apply -auto-approve -target="module.netapp_volume"

#########################################################################################################

Destroy (delete) Command for each resource, we would need to give the resource name when asked after applying command:
*********************************************************************************************************

To destroy Virtual Machine:
terraform destroy -target="module.vm_deployement"

To destroy Storage Account:
terraform destroy -target="module.Storage_Account"

To destroy App Service:
terraform destroy -target="module.App_Service"

To destroy Inbound rule in existing NSG:
terraform destroy -target="module.nsg_rule"

To destroy Application Gateway:
terraform destroy -target="module.Application_Gateway"

To destroy Load Balancer Standard:
terraform destroy -target="module.load_balancer"