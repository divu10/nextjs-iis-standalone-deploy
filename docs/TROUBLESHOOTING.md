# 🧰 Troubleshooting Guide

## ❌ 1. 502 or 500 Error in Browser
**Cause:** IIS rewrite misconfiguration or backend not running.  
**Checks & Fixes:**
- Verify ARR and URL Rewrite are installed in IIS.
- Confirm `web.config` rewrite rule points to `http://localhost:3000/`.
- Ensure the Node service is running (`Get-Service -Name vms-nextjs-app`).
- Check `node-out.log` / `node-error.log` in the release folder for startup errors.
- Test locally on the host: `curl http://localhost:3000/` — if this fails, problem is with Node/Next service.

---

## ⚙️ 2. Service not starting
**Cause:** `server.js` missing, Node path incorrect, or insufficient permissions.  
**Checks & Fixes:**
- Confirm `D:\QAWebsites\vmsqa-ver2-frontend\release\server.js` exists.
- Ensure Node is installed and located at `C:\Program Files\nodejs\node.exe` or update `scripts/nssm_install.ps1` with the correct path.
- Review NSSM logs: `nssm edit <servicename>` to inspect settings.
- Run `node server.js` manually from the release folder to see runtime errors.

---

## 🧪 3. Tests or Coverage missing (CI)
**Cause:** Tests not executed, test runner misconfigured, or coverage not output as `coverage/lcov.info`.  
**Checks & Fixes:**
- Run locally: `npm test -- --coverage` and confirm `coverage/lcov.info` is produced.
- If using Jest ensure `--coverage` flag is supported or configure `jest.config.js` to output `lcov`.
- In GitHub Actions, check the "Run Tests with Coverage" step logs for errors.
- If coverage is generated under a different path, update `sonar.javascript.lcov.reportPaths` accordingly.

---

## 🔍 4. SonarQube scan not updating dashboard
**Cause:** Scanner failure, invalid token, or missing Java.  
**Checks & Fixes:**
- Confirm Sonar token and URL are set in GitHub Secrets (`SONAR_HOST_URL`, `SONAR_TOKEN`).
- Ensure `sonar-scanner` is available on PATH. In logs look for `INFO: ANALYSIS SUCCESSFUL`.
- Ensure Java is installed and available (`java -version`) in the runner prior to scanner execution.
- Check `.scannerwork/report-task.txt` existence — the Quality Gate action reads this.

---

## 🔐 5. SSH/SCP failure from GitHub Actions
**Cause:** Wrong host/credentials or IP restrictions.  
**Checks & Fixes:**
- Confirm `SSH_HOST`, `SSH_USER`, and `SSH_PASSWORD` (or `SSH_PRIVATE_KEY`) secrets are correct.
- Validate temporary security-group ingress was added for runner IP. Check logs of the `Allow SSH temporarily` step.
- If using a private key, prefer `appleboy/ssh-action` `key` option and remove password usage.

---

## 🔁 6. Temporary SG rule not revoked
**Cause:** Revoke step failed due to IP change or insufficient permissions.  
**Checks & Fixes:**
- Inspect AWS CLI logs in the `Remove SG rule` step for errors.
- Ensure the IAM credentials used by the runner have `ec2:RevokeSecurityGroupIngress` permission.
- If the runner IP changed during the job, manual revoke may be required.

---

## 🗂️ 7. web.config removed after deploy
**Cause:** Clear-release logic removed all files.  
**Checks & Fixes:**
- Ensure PowerShell script excludes `web.config` when removing files (example included in repo).
- If `web.config` is tracked in source, consider uploading it as part of the release step instead of relying on it already existing.

---

## 📦 8. Missing `.next/standalone` after build
**Cause:** Build failed or Next config incompatible.  
**Checks & Fixes:**
- Check `npm run build` output for errors.
- Confirm `next.config.js` contains `output: "standalone"`.
- If you used `next.config.ts`, ensure TS config supports it; `next.config.js` is safer for CI.

---

## 🧾 9. IIS shows static assets but not SSR pages
**Cause:** Rewrite rule might be serving static files but not forwarding others to Node.  
**Checks & Fixes:**
- Confirm rewrite rule `negate="true"` checks for file/directory before rewriting.
- Ensure `public/` is copied to release; static files served by IIS should be accessible, SSR pages must be proxied to Node.

---

## 🛠️ 10. Logs & Debugging tips
- **Node logs:** `D:\QAWebsites\vmsqa-ver2-frontend\release\node-out.log` and `node-error.log`.
- **IIS logs:** `%SystemDrive%\inetpub\logs\LogFiles\W3SVC1`
- **NSSM events:** Check Windows Event Viewer → Application/System.
- **CI logs:** Inspect the GitHub Actions run, expand the step logs for detailed errors.
- **Sonar logs:** Look for `ANALYSIS SUCCESSFUL` in CI logs and verify `.scannerwork` folder content.

---

## 📞 Need help?
If a step is failing and you want me to review the CI logs or a specific error snippet, paste the relevant log lines here and I’ll provide targeted fixes.
