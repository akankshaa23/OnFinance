Overview

This repository contains the complete implementation for the OnFinance AI Implementation Engineer assignment. It demonstrates a full-stack application deployed on AWS EKS with professional logging, monitoring, and scalability features.


Features

- Provisioning EKS Cluster using Terraform
- Deploying frontend and backend apps using Kubernetes manifests
- Services exposed using LoadBalancer and ClusterIP
- GitHub Actions for automated deployment pipeline

Architecture

- The solution is built on AWS with the following key components:
- Amazon EKS for container orchestration
- Amazon RDS (PostgreSQL) for relational data storage
- Amazon S3 for API data storage
- AWS Lambda for data integration tasks
- CloudWatch for logging and monitoring
- ALB Ingress Controller for Kubernetes ingress management
- The architecture is designed for high availability with multi-AZ deployment and includes auto-scaling capabilities at both the Kubernetes pod and node levels.


Prerequisites

- AWS CLI configured
- Terraform installed
- `kubectl` installed
- AWS IAM permissions to manage EKS and VPC
- GitHub repository secrets set up:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `KUBE_CONFIG_DATA` (base64 encoded kubeconfig)
 

Deployment Instructions

1. Deploy Infrastructure with Terraform
- terraform init
- terraform plan
- terraform apply

2. Deploy Kubernetes Manifests
- kubectl apply -f kubernetes/backend/
- kubectl apply -f kubernetes/frontend/
- kubectl apply -f kubernetes/service/

3. Logging and Monitoring Setup
- 
