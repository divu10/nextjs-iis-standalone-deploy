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
