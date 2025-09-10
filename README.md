# OYB Status Page App 🚀

Final DevOps project – A Django-based status page application, containerized with Docker and deployed on AWS.  
The system is designed with modern DevOps practices, monitoring, and cloud services integration.

---

## 📌 Features
- Django web application served with **Gunicorn** + **Nginx**
- Containerized using **Docker**
- Images stored in **AWS ECR**
- Database in **AWS RDS (PostgreSQL)**
- Caching with **AWS ElastiCache (Redis)**
- Monitoring with **Prometheus + Grafana**
- Deployment with **Docker Compose** (and later Kubernetes)

---

## 🏗 Architecture Overview
- **App**: Django + Gunicorn container
- **DB**: AWS RDS PostgreSQL
- **Cache**: Redis (ElastiCache)
- **Monitoring**: Prometheus & Grafana
- **Registry**: AWS ECR hosts the Docker images
- **Deployment**: Initially with Docker Compose on EC2, later via Kubernetes/EKS

---

## ⚙️ Application Image Details
**Image**: `992382545251.dkr.ecr.us-east-1.amazonaws.com/oyb-status-page-app:latest`  
**Base Image**: `python:3.10-slim`  
**Entrypoint**: Gunicorn (`myproject.wsgi:application`)

### Dependencies
- Python: Django, Gunicorn, psycopg2-binary
- External: PostgreSQL (RDS), Redis (ElastiCache)

### Environment Variables
| Variable          | Description                  |
|-------------------|------------------------------|
| `DJANGO_SECRET_KEY` | Django secret key           |
| `DB_HOST`           | PostgreSQL hostname         |
| `DB_NAME`           | Database name               |
| `DB_USER`           | Database user               |
| `DB_PASSWORD`       | Database password           |
| `REDIS_HOST`        | Redis hostname              |

### Ports
- `8000` → Django + Gunicorn  
- (Future) `9090` → Prometheus  
- (Future) `3000` → Grafana  

---

## 🚀 How to Run Locally
```bash
# Build image
docker build -t status-page-app .

# Run container
docker run -d -p 8000:8000 status-page-app

# Access app
curl http://localhost:8000```

---

# 📦 Deployment on AWS

## Build & Tag the Image
```bash
docker build -t status-page-app .
docker tag status-page-app:latest 992382545251.dkr.ecr.us-east-1.amazonaws.com/oyb-status-page-app:latest```
