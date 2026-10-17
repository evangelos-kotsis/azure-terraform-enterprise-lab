# Azure Enterprise Network Infrastructure with Terraform

## Overview

This project demonstrates the deployment of a modular Azure network infrastructure using Terraform.

The goal is to simulate a development environment following Infrastructure as Code (IaC) principles, network segmentation, and basic network security practices.

## Technologies

- Microsoft Azure
- Terraform
- Azure CLI
- Git
- GitHub

## Architecture

```text
Azure Subscription
└── Resource Group: rg-enterprise-dev
    └── Virtual Network: vnet-enterprise-dev (10.20.0.0/16)
        ├── Web Subnet: snet-web (10.20.1.0/24)
        │   └── Network Security Group: nsg-web-dev
        │       └── Allow HTTPS (TCP/443)
        │           Source: 203.0.113.0/24
        ├── App Subnet: snet-app (10.20.2.0/24)
        └── Data Subnet: snet-data (10.20.3.0/24)
```

## Infrastructure Components

### Resource Group
- `rg-enterprise-dev`
- Region: North Europe

### Virtual Network
- `vnet-enterprise-dev`
- Address space: `10.20.0.0/16`

### Subnets

| Subnet | Address Prefix | Purpose |
|---|---|---|
| snet-web | 10.20.1.0/24 | Web tier |
| snet-app | 10.20.2.0/24 | Application tier |
| snet-data | 10.20.3.0/24 | Data tier |

### Network Security

A Network Security Group (`nsg-web-dev`) is associated with the Web subnet.

A custom inbound security rule allows:

- Protocol: TCP
- Destination port: 443 (HTTPS)
- Source: `203.0.113.0/24`
- Action: Allow
- Priority: 100

**Note:** `203.0.113.0/24` is a reserved documentation IP range used for educational purposes. It does not represent a real corporate network.

Azure's default NSG rules remain in effect.

## Project Structure

```text
terraform/
├── .gitignore
├── README.md
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── providers.tf
│       └── .terraform.lock.hcl
└── modules/
    └── network/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

## Deployment Workflow

From the `terraform/environments/dev` directory:

```bash
terraform init
terraform fmt -recursive ../../
terraform validate
terraform plan
terraform apply
```

Review the execution plan before approving infrastructure changes.

## Security Considerations

- Terraform state files are excluded from Git.
- Local Terraform provider directories are excluded from Git.
- Infrastructure is managed through Terraform configuration.
- Network security rules are defined as code.
- The HTTPS rule uses a documentation-only source range.
- No virtual machines or application workloads are deployed.

For production environments, use a secured remote Terraform backend, appropriate access controls, and environment-specific security policies.

## Learning Outcomes

This project demonstrates practical experience with:

- Infrastructure as Code (IaC)
- Terraform modules
- Azure Virtual Networks and subnets
- Network Security Groups
- Network segmentation
- Terraform state management fundamentals
- Git version control
- Azure infrastructure validation

## Disclaimer

This project is intended for learning and portfolio demonstration purposes. It is not a production-ready network architecture.