# 🏗️ Deployment Guide — VMS Frontend (Next.js on IIS)

## 1️⃣ Prerequisites
- Windows Server (2019 or later)
- Node.js v20+
- IIS installed
- ARR (Application Request Routing) and URL Rewrite modules
- NSSM (Non-Sucking Service Manager)
- GitHub Actions runner or remote SSH access

## 2️⃣ Setup Steps
1. **Install Node.js**
2. **Install NSSM**
- Download from https://nssm.cc/download
- Place under `C:\nssm\win64\nssm.exe`

3. **Install IIS + ARR**
- Open Server Manager → Add Roles → Web Server (IIS)
- Install “Application Request Routing” and “URL Rewrite Module”.

4. **Create Deployment Path**
5. **Configure web.config**
- Use example from `/examples/web.config`
- Ensure rewrite rule points to `localhost:3000`

6. **Configure Service**
- Run `scripts/nssm_install.ps1` once deployment is complete.

7. **AWS SSM Setup**
- Create parameters (as per `infra/ssm-params-example.json`)
- Assign IAM permissions defined in `infra/iam/deployment-iam-policy.json`

8. **GitHub Secrets**
- Add SSH and AWS credentials to GitHub repo settings.

9. **Trigger Deployment**
- Push to `main` or trigger manually from Actions tab.

## ✅ Verification
- Browse `https://vmsqa-ver2-frontend.compunnel.com`
- Check IIS logs for proxy success
- Check `node-out.log` for app startup confirmation

## 🧩 Troubleshooting
See [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
