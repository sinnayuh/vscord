# Fix AngelScript Image Not Showing

The extension is trying to load the AngelScript icon from GitHub, but since you're using a custom build, the image might not be available at that URL.

## Solution: Configure Custom Image URL

You have two options:

### Option 1: Use a Custom Image URL (Recommended for Testing)

1. Host your `angelscript.png` file somewhere publicly accessible (GitHub, Imgur, etc.)
2. Open VS Code Settings (`Ctrl+,`)
3. Search for "vscord.status.image.large.editing.key"
4. Change the value from:
   ```
   https://raw.githubusercontent.com/LeonardSSH/vscord/main/assets/icons/{lang}.png
   ```
   To your custom URL (replace `{lang}` with `angelscript`):
   ```
   https://your-host.com/path/to/angelscript.png
   ```

   OR use a pattern that works for all languages:
   ```
   https://your-host.com/path/to/{lang}.png
   ```

### Option 2: Upload to GitHub

If you have a GitHub fork of the vscord repository:

1. Upload `assets/icons/angelscript.png` to your fork
2. Update the image URL setting to point to your fork:
   ```
   https://raw.githubusercontent.com/YOUR_USERNAME/vscord/main/assets/icons/{lang}.png
   ```

### Option 3: Check Language ID

The extension might not be detecting the language ID correctly. To check:

1. Open your `.as` file in VS Code
2. Press `Ctrl+Shift+P`
3. Type "Change Language Mode"
4. Check what language ID is shown (it should be "angelscript")

If it's not "angelscript", you may need to:
- Install an AngelScript language extension
- Or the extension will fall back to file extension matching (which should work with our `.as` mapping)

### Debugging

To see what's being resolved:

1. Open VS Code Developer Tools (`Help > Toggle Developer Tools`)
2. Go to the Console tab
3. Look for log messages showing the resolved language name
4. The `resolveLangName` function logs the filename

The resolved language name should be "angelscript" (lowercase), which will be used in the image URL.

