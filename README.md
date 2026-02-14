

## 🚀 Cloud-Native Boardgame Application (EKS + RDS + CI/CD + ALB)

### 📌 Overview

This project demonstrates a production-grade cloud-native deployment of a Spring Boot application on AWS using modern DevOps practices.

The application is containerized, deployed to Amazon EKS, connected securely to Amazon RDS (MySQL), and exposed via AWS Application Load Balancer using Ingress. Full CI/CD automation is implemented using GitHub Actions.

---

## 🏗️ Architecture

```
Internet
   ↓
Application Load Balancer (ALB)
   ↓
EKS Cluster (Private Subnets)
   ↓
Spring Boot Pods
   ↓
Amazon RDS MySQL (Private Subnet)
```

Infrastructure is provisioned using Terraform modules.

---

## ⚙️ Tech Stack

### ☁️ Cloud

* AWS EKS (Managed Node Groups)
* Amazon RDS (MySQL)
* Amazon ECR
* AWS ALB (via Load Balancer Controller)
* VPC (Public + Private Subnets)
* NAT Gateway
* Bastion Host

### 🐳 Containerization

* Docker (Distroless Image)
* Multi-stage build

### ☸️ Kubernetes

* Deployment
* ClusterIP Service
* Ingress (ALB)
* Secrets
* Rolling Updates

### 🔁 CI/CD

* GitHub Actions
* Docker build & push to ECR
* Dynamic image tagging (commit SHA)
* Auto-deployment to EKS

### 📊 Monitoring

* Prometheus
* Grafana
* Spring Boot Actuator

---

## 🔐 Security Implementation

* Private EKS nodes
* Private RDS instance
* Security group layered access
* IAM Roles for Service Accounts (IRSA)
* Kubernetes Secrets for DB credentials
* No public DB exposure

---

## 🚀 CI/CD Flow

```
Git Push → GitHub Actions
          → Build JAR
          → Build Docker Image
          → Push to ECR
          → Inject Image Tag
          → kubectl apply
          → Rolling Update
```

---

## 📁 Project Structure

```
.
├── src/
├── Dockerfile
├── pom.xml
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ingress.yaml
└── .github/workflows/deploy.yml
```

---

## 🎯 Key Learnings

* Infrastructure as Code (Terraform modular design)
* Production-ready EKS networking
* Secure RDS integration
* ALB Ingress configuration
* GitOps-style deployment strategy

---

## 📌 Future Improvements

* Blue-Green deployment
* HPA Autoscaling
* Centralized logging (ELK/EFK)

---
