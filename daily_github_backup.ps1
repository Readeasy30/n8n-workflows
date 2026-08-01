Set-Location -Path "C:\Users\Carol\n8n_data"

# Force n8n to export all visual workflows from the docker container to raw JSON files
docker exec n8n-automation n8n export:workflow --all --output=/home/node/.n8n/workflows_backup.json

# Check if there are changes to push
git add .
$status = git status --porcelain

if ($status) {
    # Commit changes with a timestamp and the host computer name (e.g. Carol)
    git commit -m "Automated daily workflow backup from $env:COMPUTERNAME on $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
    git push origin main
}
