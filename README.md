# VMS Frontend Deploy 🚀

A fully automated CI/CD setup for deploying a **Next.js standalone build** to a **Windows IIS server** using **GitHub Actions**, **NSSM**, **AWS SSM**, and **SonarQube** integration.

## 📦 Overview
This repository contains:
- Automated build and deployment pipeline (GitHub Actions)
- IIS + NSSM-based service configuration
- Secure credential management via AWS SSM
- SonarQube quality and coverage checks
- GitLeaks for secret scanning

## 🧱 Stack
- **Frontend Framework:** Next.js (Standalone output)
- **Server:** IIS + Node (via NSSM)
- **CI/CD:** GitHub Actions
- **Security:** AWS SSM Parameter Store, GitLeaks
- **Quality:** SonarQube integration

## 🌐 QA Environment
| Component | Details |
|------------|----------|
| **URL** | [https://vmsqa-ver2-frontend.compunnel.com](https://vmsqa-ver2-frontend.compunnel.com) |
| **Deployment** | GitHub Actions → Windows IIS Server |
| **Build Command** | `npm run build` |
| **Test Command** | `npm test -- --coverage` |

## 🔐 AWS SSM Parameters
All credentials are stored in **AWS Systems Manager Parameter Store** — no credentials are kept in source code or web.config.

Example:
## ⚙️ CI/CD Secrets Required
| Secret | Description |
|---------|--------------|
| `SSH_HOST` | Windows server IP or hostname |
| `SSH_USER` | SSH username |
| `SSH_PASSWORD` | SSH password (or use private key) |
| `AWS_ACCESS_KEY_ID` / `AWS_SECRET_ACCESS_KEY` | IAM user with EC2 & SSM permissions |
| `SONAR_HOST_URL` | SonarQube server URL |
| `SONAR_TOKEN` | SonarQube authentication token |

## 🚀 Pipeline Summary
1. Checkout → Install → Build (Next.js standalone)
2. Run test coverage
3. Run SonarQube scan
4. Prepare release folder
5. SCP upload → Restart NSSM Windows service
6. Remove temporary SSH SG rule

## 🧰 Directory Structure
See [docs/README_DEPLOYMENT.md](docs/README_DEPLOYMENT.md) for full breakdown.

## 🧩 License
MIT License

Copyright (c) 2025 Divya Pratap Singh

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction...
