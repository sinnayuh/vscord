# Export VS Code Settings Guide

## Method 1: Export All Settings via Command Palette

1. Open VS Code
2. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
3. Type and select: **"Preferences: Open User Settings (JSON)"**
4. Copy the entire contents
5. Save to a file (e.g., `my-vscode-settings.json`)

## Method 2: Copy Settings Files Directly

### Windows Paths:

- **User Settings**: `%APPDATA%\Code\User\settings.json`
- **Keybindings**: `%APPDATA%\Code\User\keybindings.json`
- **Snippets**: `%APPDATA%\Code\User\snippets\`
- **Extensions List**: Use command below

### Export Extensions List:

```bash
code --list-extensions > extensions.txt
```

### Export All Settings (PowerShell):

```powershell
# Create backup folder
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\vscode-settings-backup"

# Copy user settings
Copy-Item "$env:APPDATA\Code\User\settings.json" "$env:USERPROFILE\vscode-settings-backup\"
Copy-Item "$env:APPDATA\Code\User\keybindings.json" "$env:USERPROFILE\vscode-settings-backup\" -ErrorAction SilentlyContinue

# Export extensions
code --list-extensions > "$env:USERPROFILE\vscode-settings-backup\extensions.txt"
```

## Method 3: Export Only VSCord Extension Settings

If you only want to export your VSCord extension settings:

1. Open VS Code Settings (`Ctrl+,`)
2. Search for "vscord"
3. Click the "Open Settings (JSON)" icon (top right)
4. Copy only the `vscord.*` settings
5. Save to a file

Or manually copy from your settings.json:

```json
{
    "vscord.enable": true,
    "vscord.app.name": "Code",
    "vscord.status.details.text.editing": "In {workspace} {problems}"
    // ... other vscord settings
}
```

## Importing Settings

### Import User Settings:

1. Open VS Code
2. Press `Ctrl+Shift+P`
3. Type: **"Preferences: Open User Settings (JSON)"**
4. Paste your exported settings
5. Save (`Ctrl+S`)

### Import Extensions:

```bash
# Install all extensions from list
cat extensions.txt | ForEach-Object { code --install-extension $_ }
```

### Import Workspace Settings:

Copy `.vscode/settings.json` to your new workspace folder
