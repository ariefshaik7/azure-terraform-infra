
# 🌐 Azure Infrastructure with Terraform

This project provisions Azure infrastructure using a **modular Terraform setup**, designed for clean, reusable, and scalable infrastructure-as-code (IaC) practices for fast, single-environment deployments.

It provisions common Azure resources including:

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
├── terraform.tfvars         # Input variable values 
├── backend.config           # Remote backend config (not committed)
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

---

## 📦 Modules Overview

Each module contains:
- `main.tf` – Resource definitions
- `variables.tf` – Input variables
- `outputs.tf` – Module outputs

### Modules:
- **`resource-group`** – Creates a resource group in a chosen Azure region.
- **`virtual-network`** – Defines a VNet with address space and subnets.
- **`subnet`** – Creates a subnet inside the VNet.
- **`nsg`** – Builds a Network Security Group with rule sets.
- **`nic`** – Provisions NICs and attaches to subnets + NSGs.
- **`public_ip`** – Allocates a public IP address.
- **`virtual-machine`** – Creates a Linux VM with SSH key auth.
- **`storage-account`** – Adds a general-purpose storage account.

---

## ✅ Prerequisites

Ensure you have the following installed:

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- An active Azure subscription

---

## 🔐 Authentication Methods

You can authenticate Terraform with Azure using one of the following:

- **Azure CLI:**  
  Run `az login` and Terraform will auto-use your session.

- **Service Principal:**  
  Export these environment variables:
  ```bash
  export ARM_CLIENT_ID=""
  export ARM_CLIENT_SECRET=""
  export ARM_SUBSCRIPTION_ID=""
  export ARM_TENANT_ID=""
  ```

- **Azure Cloud Shell / Managed Identity** is also supported.

---

## ⚙️ Using `terraform.tfvars`

Create a `terraform.tfvars` file in your root directory with real values like:

```hcl
location             = "centralindia"
resource_group_name  = "rg-demo"

vnet_name            = "vnet-demo"
vnet_address_space   = ["10.0.0.0/16"]

subnet_name          = "subnet-demo"
subnet_address_prefixes = ["10.0.1.0/24"]

nsg_name             = "nsg-demo"
public_ip_name       = "public-ip-demo"
allocation_method    = "Dynamic"

nic_name             = "nic-demo"
vm_name              = "vm-demo"
vm_size              = "Standard_B1ls"
computer_name        = "vm-host"
admin_username       = "azureuser"
public_key_path      = "~/.ssh/id_rsa.pub"
```

📌 *Note: Never commit this file with real secrets or private values.*

---


### 📌 Make sure you have a remote backend configured.

## 🌐 Configuring Remote Backend


Remote state is stored in an Azure Storage Account. Use the included script:

```bash
bash create-azure-tf-backend.sh
```

This script will:
- Create a resource group
- Create a uniquely named storage account
- Create a blob container named `tfstate`


To manage Terraform state remotely in Azure Storage, use a `backend.config` file:

```hcl
resource_group_name  = "demo-rg"
storage_account_name = "demostorage123"
container_name       = "tfstate"
key                  = "terraform.tfstate"
```

Initialize Terraform with it:

```bash
terraform init -backend-config="backend.config"
```

✅ *Do not commit real backend configs. Use placeholders or `.gitignore`.*

---

## 🚀 Usage

1. **Clone this repository**:
    ```bash
    git clone https://github.com/yourusername/azure-terraform-infra.git
    cd azure-terraform-infra
    ```

2. **Login to Azure**:
    ```bash
    az login
    ```

3. **Initialize Terraform**:
    ```bash
    terraform init -backend-config="backend.config"
    ```

4. **Validate configuration**:
    ```bash
    terraform validate
    ```

5. **Preview the changes**:
    ```bash
    terraform plan -var-file="terraform.tfvars"
    ```

6. **Apply the configuration**:
    ```bash
    terraform apply -var-file="terraform.tfvars"
    ```

7. **View Outputs**:
    ```bash
    terraform output
    ```

8. **To refresh state** (if needed):
    ```bash
    terraform refresh
    ```

9. **To destroy resources**:
    ```bash
    terraform destroy -var-file="terraform.tfvars"
    ```

---

## 🛑 Recommended `.gitignore`

```bash
*.tfstate
*.tfstate.backup
.terraform/
terraform.tfvars
backend.config
*.pem
*.key
*.log
```

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).

---

## 🙌 Contributions

Feel free to fork, improve, and submit PRs!

---

