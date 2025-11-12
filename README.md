# vms-frontend-deploy

Repo contains CI/CD and deployment utilities for the VMS frontend (Next.js standalone on IIS).

## Quick summary
- Build: Next.js standalone
- Deploy: GitHub Actions -> SCP -> Windows host (IIS + NSSM)
- Code quality: SonarQube, test coverage via `coverage/lcov.info`
- Secrets: AWS SSM Parameter Store for production secrets

## Requirements
- Windows host with Node.js (LTS), NSSM, IIS with ARR + URL Rewrite
- GitHub repository secrets configured (see `.github/WORKFLOW_SECRETS.md`)

## Local dev
1. `npm install`
2. `npm test -- --coverage` ⇒ produces `coverage/lcov.info`
3. `npm run build`

## Deploy (CI)
- Push to monitored branch triggers deploy pipeline. See `.github/workflows/deploy.yml`
