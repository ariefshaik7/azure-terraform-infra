# 🌐 Azure Infrastructure with Terraform

This project provisions Azure infrastructure using a modular Terraform setup making it easy to deploy and manage cloud infrastructure with reusability and clarity. 
It includes common resources such as:

- Resource Group
- Virtual Network
- Subnet
- NSG (Network Security Group)
- NIC (Network Interface)
- Public IP
- Virtual Machine
- Storage Account

---

## 📁 Project Structure

```
azure-terraform-infra/
├── main.tf
├── outputs.tf
├── providers.tf
├── terraform.tfvars
├── variables.tf
├── modules/
│   ├── resource-group/
│   ├── virtual-network/
│   ├── subnet/
│   ├── nsg/
│   ├── nic/
│   ├── public_ip/
│   ├── virtual-machine/
│   └── storage-account/
```
## Modules

- `resource-group` – Creates a resource group in a specified Azure region.

- `virtual-network` – Deploys a virtual network with address space and subnets.

- `subnet` – Defines and provisions subnets within the virtual network.

- `nsg` – Creates a Network Security Group with configurable rules.

- `nic` – Provisions a network interface card attached to subnets and NSGs.

- `public_ip` – Allocates a static public IP address.

- `virtual-machine` – Deploys a virtual machine with network interfaces and public IP.

- `storage-account` – Creates a storage account for general-purpose use.

Each module includes:
- `main.tf` – Resource configuration
- `variables.tf` – Input variables
- `outputs.tf` – Output values

---

## Requirements

Make sure you have the following installed:

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- An active Azure subscription
---

## Authentication Methods

There are several ways to authenticate to Azure when using Terraform:

- **Azure CLI Authentication:**  
  Use `az login` to authenticate your CLI session, which Terraform will use automatically.

- **Service Principal with Client Secret:**  
  Create a service principal and provide the client ID, client secret, and tenant ID as environment variables or in your provider configuration.

- **Managed Identity:**  
  Use a managed identity (if running on Azure resources like Azure VM or Azure DevOps) to authenticate without credentials.

- **Environment Variables:**  
  Set environment variables such as `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_TENANT_ID`, and `ARM_SUBSCRIPTION_ID` for Terraform Azure Provider to use.

- **Azure Cloud Shell:**  
  Running Terraform inside Azure Cloud Shell automatically authenticates via the shell's identity.


---

Login to your Azure account using:

```bash
az login
```
Update terraform.tfvars:
 - Set values for variables like:
```bash
resource_group_name = "your-rg"
location            = "East US"
ssh_public_key_path = "~/.ssh/id_rsa.pub"

```
---
##  Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/your-repo-name.git
    cd your-repo-name
    ```

2. Initialize Terraform:

    ```bash
    terraform init
    ```
3. Validate Configuration:

    ```bash
    terraform validate
    ```

4. Preview the changes:

    ```bash
    terraform plan
    ```
5. Apply the configuration:

    ```bash
    terraform apply
    ```
6. Destroy the infrastructure (if needed):

    ```bash
    terraform destroy
    ```
7. Show Outputs:

    ```bash
    terraform output
    ```
7. If you don't see the desired output:

    ```bash
    terraform refresh
    ```


## License

This project is open source and available under the MIT License.
