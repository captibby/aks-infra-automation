AKS Deployment with Terraform and Kubernetes

Overview
This project deploys an Azure Kubernetes Service (AKS) cluster using Terraform and automates Kubernetes resource deployment using Ansible. It demonstrates how to create and manage infrastructure and applications in a seamless, automated manner.

Features
Infrastructure as Code (IaC): Terraform used to provision an AKS cluster with multiple node pools.
Kubernetes Workloads: Deploys NGINX and MySQL applications with node affinity and services.
Automation: Ansible playbook handles the end-to-end workflow, ensuring idempotence and reliability.


Folder Structure

terraform-aks/
│
├── terraform/               # Terraform configuration files
│   ├── main.tf              # Main Terraform configuration
│   ├── variables.tf         # Input variables
│   ├── outputs.tf           # Output variables
│   ├── backend.tf           # Backend configuration
│   ├── terraform.tfvars     # Variable values
│
├── k8s/                     # Kubernetes manifests
│   ├── deployment.yaml      # NGINX and MySQL deployments
│   ├── service.yaml         # Services for NGINX and MySQL
│
├── ansible/                 # Ansible playbook and roles
│   ├── playbook.yml         # Main playbook
│   ├── inventory.yml        # Ansible inventory
│   ├── roles/
│       ├── terraform/       # Role for managing Terraform actions
│       ├── kubernetes/      # Role for applying Kubernetes manifests
│
└── README.md                # Project documentation

Prerequisites
Azure Requirements
   - Azure Subscription
   - Sufficient vCPU quotas in your selected region
   - Access to create AKS clusters and manage Azure resources
   - Azure CLI installed and authenticated (az login)
Terraform installed and authenticated for provisioning Azure infrastructure
Kubectl installed and configured for managing Kubernetes clusters
Ansible installed and operational for automating infrastructure and application deployment