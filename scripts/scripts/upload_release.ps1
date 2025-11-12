param(
  [string]$TargetPath = "D:\QAWebsites\vmsqa-ver2-frontend\release",
  [string]$LocalPath = ".\release"
)

Write-Host "Uploading release to $TargetPath ..."
if (!(Test-Path $TargetPath)) { New-Item -ItemType Directory -Path $TargetPath | Out-Null }
Copy-Item -Recurse -Force "$LocalPath\*" $TargetPath
Write-Host "✅ Upload complete."
