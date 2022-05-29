# Nsx-T-ovf-deploy

Here we are deploying NSX-T 3.2.1 OVF using terraform.
We have three file :
Variable.tf : Stands for initializing variable
terraform.tfvars : Here we are declaring variable values
main.tf : Here we are calling provider : vsphere
           Data : adding all data details
           Resource : vsphere_virtual_machine from vmFromRemoteOvf
           
Steps of execution:
PS C:\terraform\nsx-t> terraform -version
Terraform v1.1.9
on windows_amd64
+ provider registry.terraform.io/hashicorp/vsphere v2.1.1

Your version of Terraform is out of date! The latest version
is 1.2.1. You can update by downloading from https://www.terraform.io/downloads.html

PS C:\terraform\nsx-t> terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/vsphere from the dependency lock file
- Using previously-installed hashicorp/vsphere v2.1.1

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

PS C:\terraform\nsx-t> terraform plan -out nsxt.tfplan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  Plan: 1 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Saved the plan to: nsxt.tfplan

To perform exactly these actions, run the following command to apply:
    terraform apply "nsxt.tfplan"
    
   PS C:\terraform\nsx-t> terraform apply "nsxt.tfplan"
vsphere_virtual_machine.vmFromRemoteOvf: Creating...
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [10s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [20s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [30s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [40s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [50s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [1m0s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [1m10s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [1m20s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [1m30s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [1m40s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [1m50s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [2m0s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [2m10s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [2m20s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [2m30s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [2m40s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [2m50s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [3m0s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [3m10s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [3m20s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [3m30s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Still creating... [3m40s elapsed]
vsphere_virtual_machine.vmFromRemoteOvf: Creation complete after 3m43s 

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
