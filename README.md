# 🚀 AWS Infrastructure with Terraform 

This repository contains Terraform configurations to provision AWS infrastructure, with automated deployment integrated via Bitbucket Pipelines.

## 📁 Files Overview

- `backend.tf` – Configures the remote state backend (e.g., S3 and DynamoDB for state locking).
- `bitbucket-pipelines.yml` – Defines the CI/CD pipeline to automate Terraform operations.
- `data.tf` – Declares data sources such as AMIs, VPCs, or availability zones.
- `main.tf` – Main Terraform configuration for provisioning AWS resources.
- `outputs.tf` – Specifies output variables to be displayed after provisioning (e.g., IPs, resource IDs).
- `variables.tf` – Contains input variable definitions used across the Terraform modules.

---

## 🧱 Prerequisites

- [Terraform](https://www.terraform.io/downloads) installed
- AWS credentials configured (`~/.aws/credentials` or environment variables)
- S3 bucket and DynamoDB table if using remote state backend

---

## ⚙️ Usage

### 1. Clone the Repository

```bash
git clone https://bitbucket.org/your-org/your-repo.git
```
