# VS Code Settings Export Script
# This script exports your VS Code settings, keybindings, and extensions list

$backupFolder = "$env:USERPROFILE\vscode-settings-backup-$(Get-Date -Format 'yyyy-MM-dd-HHmmss')"
New-Item -ItemType Directory -Force -Path $backupFolder | Out-Null

Write-Host "Exporting VS Code settings to: $backupFolder" -ForegroundColor Green

# Export User Settings
$userSettingsPath = "$env:APPDATA\Code\User\settings.json"
if (Test-Path $userSettingsPath) {
    Copy-Item $userSettingsPath "$backupFolder\settings.json"
    Write-Host "✓ User settings exported" -ForegroundColor Green
} else {
    Write-Host "✗ User settings not found" -ForegroundColor Yellow
}

# Export Keybindings
$keybindingsPath = "$env:APPDATA\Code\User\keybindings.json"
if (Test-Path $keybindingsPath) {
    Copy-Item $keybindingsPath "$backupFolder\keybindings.json"
    Write-Host "✓ Keybindings exported" -ForegroundColor Green
} else {
    Write-Host "✗ Keybindings not found" -ForegroundColor Yellow
}

# Export Extensions List
$extensionsPath = "$backupFolder\extensions.txt"
$extensions = code --list-extensions 2>&1
if ($LASTEXITCODE -eq 0 -and $extensions) {
    $extensions | Out-File -FilePath $extensionsPath -Encoding utf8
    Write-Host "✓ Extensions list exported" -ForegroundColor Green
} else {
    Write-Host "✗ Could not export extensions (make sure 'code' command is in PATH)" -ForegroundColor Yellow
}

# Export Snippets folder if it exists
$snippetsPath = "$env:APPDATA\Code\User\snippets"
if (Test-Path $snippetsPath) {
    Copy-Item -Path $snippetsPath -Destination "$backupFolder\snippets" -Recurse -Force
    Write-Host "✓ Snippets exported" -ForegroundColor Green
}

Write-Host "`nExport complete! Files saved to: $backupFolder" -ForegroundColor Cyan
Write-Host "`nTo import:" -ForegroundColor Yellow
Write-Host "1. Copy settings.json to: $env:APPDATA\Code\User\settings.json"
Write-Host "2. Copy keybindings.json to: $env:APPDATA\Code\User\keybindings.json"
Write-Host "3. Install extensions: Get-Content $extensionsPath | ForEach-Object { code --install-extension `$_ }"

