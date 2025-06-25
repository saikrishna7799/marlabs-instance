# marlabs-instance

# Secure Self-Service Developer Environment on Azure

## Overview

This project provides a secure, automated, and cost-controlled way for developers to provision their own development environments on Azure using:

- **Terraform** (Infrastructure as Code)
- **Azure DevOps Pipelines** (CI/CD)
- **Azure native security best practices**
- **RBAC and manual approval workflows**
- **Cost tagging and TTL-based lifecycle**

## Features

- Modular and reusable Terraform code (VM, network)
- Parameterized pipelines for per-user provisioning
- Environment-based approval process
- Private networking with NSG rules (no public IP)
- SSH-only access via Azure Key Vault or user-provided key
- Auto-tagging for cost control, ownership, TTL
- Azure Monitor and activity logs supportable

```

---

## Prerequisites

- Azure Subscription
- Azure DevOps Project
- Developer must have permissions to trigger the pipeline
- Azure Managed Identity enabled for secure authentication

---

## Terraform Usage

To manually test:
```bash
terraform init
terraform plan
terraform apply
```

Set your variables in `terraform.tfvars`.

---

## Azure DevOps CI/CD

### Manual Approval with Environment

Pipeline: [`terraform_pipeline_env_approval.yml`](terraform_pipeline_env_approval.yml)

This pipeline:

1. Waits for approval via Azure DevOps **Environments** (name: `DevEnv-Approval`)
2. Provisions infra with user-defined developer name
3. Uses system-assigned Managed Identity for login

### Example Run

Trigger pipeline with parameter:
```
dev_username: alice.smith
```

---

## Security Best Practices

- No public IPs on VM or NIC
- NSG blocks all inbound traffic
- SSH access only via Azure-managed key
- System-assigned identity on VM
- Azure Key Vault recommended for secrets

---

## Cost Controls

- TTL tag (e.g. `"TTL" = "4h"`) can be used with automation to destroy expired environments
- Owner and CostCenter tags help in tracking spend

---

## RBAC & Logging

- Only authorized users can trigger pipeline
- All changes go through approval environment
- Azure Activity Logs + Monitor for tracking and alerts


```


```

