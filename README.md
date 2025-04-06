Overview

This repository contains the complete implementation for the OnFinance AI Implementation Engineer assignment. It demonstrates a full-stack application deployed on AWS EKS with professional logging, monitoring, and scalability features.


Features

- Provisioning EKS Cluster using Terraform
- Deploying frontend and backend apps using Kubernetes manifests
- Services exposed using LoadBalancer and ClusterIP
- GitHub Actions for automated deployment pipeline

Architecture

![architecture](https://github.com/user-attachments/assets/446ef723-0994-45d8-9367-a0e7fbbc580b)


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

3. Monitoring and Troubleshooting
 - View Kubernetes logs:
    - kubectl logs -n onfinance <pod-name>
 - Check CloudWatch logs:
    - Navigate to CloudWatch > Logs > Log groups
    - Look for /aws/eks/<cluster-name>/application
   

![image](https://github.com/user-attachments/assets/3b3b15d6-f2ec-4b5e-a093-88f4a38eaa2b)

![image](https://github.com/user-attachments/assets/acc770d0-a966-4afb-9d57-8ec551d448d3)

![image](https://github.com/user-attachments/assets/aad25176-d25b-43e2-901c-f586345038f6)

![image](https://github.com/user-attachments/assets/a7431c35-c3aa-41f6-b334-cf95a22fb076)

![image](https://github.com/user-attachments/assets/8af84c70-1710-4fbc-a0d5-efea4637f7b9)

![image](https://github.com/user-attachments/assets/aea105f9-10b4-4a53-9952-38464cbefd56)









