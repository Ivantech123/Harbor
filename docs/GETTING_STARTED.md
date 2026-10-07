# Getting Started with Harbor Browser

> [Русская версия](./GETTING_STARTED_RU.md)

Welcome to Harbor Browser! This guide will help you get started with downloading, installing, and using Harbor.

## System Requirements

### Windows
- **OS:** Windows 10 or later
- **RAM:** 4GB minimum (8GB recommended)
- **Disk Space:** 500MB
- **Architecture:** x86-64 or ARM64

### macOS
- **OS:** macOS 10.15 or later
- **RAM:** 4GB minimum (8GB recommended)
- **Disk Space:** 500MB
- **Architecture:** Intel or Apple Silicon

### Linux
- **Distributions:** Ubuntu 20.04+, Fedora 33+, or similar
- **RAM:** 4GB minimum (8GB recommended)
- **Disk Space:** 500MB
- **Architecture:** x86-64 or AArch64

## Installation

### Windows

#### Option 1: Installer
1. Download `harbor-windows.exe` from [GitHub Releases](https://github.com/Ivantech123/Harbor/releases)
2. Double-click the installer
3. Follow the installation wizard
4. Launch Harbor from Start Menu or Desktop

#### Option 2: Portable
1. Download `harbor-windows-portable.zip`
2. Extract to desired location
3. Run `harbor.exe`

#### Option 3: Microsoft Store (if available)
1. Search for "Harbor Browser" in Microsoft Store
2. Click Install
3. Launch from Start Menu

### macOS

#### Option 1: DMG Installer
1. Download `harbor-macos.dmg` from [GitHub Releases](https://github.com/Ivantech123/Harbor/releases)
2. Double-click to mount the disk image
3. Drag Harbor.app to Applications folder
4. Launch from Applications

#### Option 2: Command Line
```bash
# Using Homebrew (if available)
brew install harbor
```

### Linux

#### Option 1: AppImage
```bash
# Download
wget https://github.com/Ivantech123/Harbor/releases/download/latest/harbor-linux.AppImage

# Make executable
chmod +x harbor-linux.AppImage

# Run
./harbor-linux.AppImage
```

#### Option 2: Package Manager
```bash
# Ubuntu/Debian
sudo apt install harbor-browser

# Fedora
sudo dnf install harbor-browser

# Arch
yay -S harbor-browser
```

#### Option 3: Flatpak
```bash
flatpak install harbor-browser
flatpak run harbor-browser
```

## First Launch

1. **Download & Install** following steps above
2. **Launch Harbor** from your applications
3. **Set as Default Browser** (recommended)
   - Settings → Default Browser
   - Click "Set as default"
4. **Sign in** (optional) to sync settings
5. **Explore Features** - See Features guide

## Basic Usage

### Interface Overview

```
┌─────────────────────────────────────┐
│  Harbor Toolbar                     │
├──────────┬────────────────────┬─────┤
│ Spaces   │ Navigation Bar     │ Menu│
├──────────┼────────────────────┤     │
│ Sidebar  │ Tabs               │     │
│          ├────────────────────┤     │
│          │ Web Content        │     │
│          │                    │     │
│          │                    │     │
└──────────┴────────────────────┴─────┘
```

### Main Features

- **Spaces** - Organize tabs into isolated workspaces
- **Tabs** - Advanced tab management with groups and pinning
- **Split View** - View two pages side-by-side
- **Bookmarks** - Organize favorites with folders
- **History** - Track visited pages
- **Settings** - Customize Harbor to your preference

### Keyboard Shortcuts

| Action | Shortcut |
|--------|----------|
| New Tab | Ctrl+T (Windows/Linux), Cmd+T (Mac) |
| New Window | Ctrl+N (Windows/Linux), Cmd+N (Mac) |
| Close Tab | Ctrl+W (Windows/Linux), Cmd+W (Mac) |
| Reopen Tab | Ctrl+Shift+T (Windows/Linux), Cmd+Shift+T (Mac) |
| Zoom In | Ctrl++ (Windows/Linux), Cmd++ (Mac) |
| Zoom Out | Ctrl+- (Windows/Linux), Cmd+- (Mac) |
| Full Screen | F11 (Windows/Linux), Cmd+Ctrl+F (Mac) |
| Developer Tools | F12 (Windows/Linux), Cmd+Option+I (Mac) |

## Setting Preferences

1. Click **Menu** (☰) in top-right
2. Select **Settings**
3. Explore categories:
   - **General** - Basic options
   - **Home** - Homepage settings
   - **Search** - Search engine
   - **Privacy & Security** - Privacy options
   - **Appearance** - Theme and colors
   - **Mods** - Customize UI with CSS

## Updating Harbor

### Automatic Updates
Harbor checks for updates automatically. When available:
1. Click the update notification
2. Download and install
3. Restart Harbor

### Manual Check
1. Click **Menu** (☰)
2. Select **About Harbor**
3. Check for updates

### Twilight Channel
To use the testing channel:
1. Visit Settings
2. Go to About section
3. Switch to "Twilight" channel
4. Restart Harbor

## Uninstalling

### Windows
1. Settings → Apps → Apps & features
2. Find "Harbor Browser"
3. Click → Uninstall
4. Confirm removal

### macOS
1. Open Finder
2. Go to Applications
3. Find Harbor.app
4. Drag to Trash

### Linux
```bash
# Ubuntu/Debian
sudo apt remove harbor-browser

# Fedora
sudo dnf remove harbor-browser

# Arch
yay -R harbor-browser
```

## Local Development Setup

Want to build Harbor from source? See [Contributing Guide](./contribute.md#local-development-setup).

### Quick Start
```bash
# Clone repository
git clone https://github.com/Ivantech123/Harbor.git
cd Harbor

# Install dependencies
npm install

# Set up environment
npm run init

# Start development version
npm start
```

## Troubleshooting

### Harbor won't start
- Try clearing cache: Delete profile folder
- Reinstall Harbor
- Check system requirements

### Crashes on startup
- Update to latest version
- Check system resources (RAM, disk space)
- Try safe mode (if available)

### Slow performance
- Check Settings → Performance
- Disable unused extensions
- Clear browsing data

For more help, see [Troubleshooting Guide](./TROUBLESHOOTING.md).

## Getting Help

- **Documentation:** [docs/](./README.md)
- **Issues:** [GitHub Issues](https://github.com/Ivantech123/Harbor/issues)
- **Discussions:** [GitHub Discussions](https://github.com/Ivantech123/Harbor/discussions)
- **FAQ:** [Frequently Asked Questions](./FAQ.md)

## Next Steps

1. Explore [Features Guide](./FEATURES.md)
2. Customize Harbor in Settings
3. Read [Tips & Tricks](./FAQ.md#tips--tricks)
4. Consider [Contributing](./contribute.md)

---

**Language:** English | [Русский](./GETTING_STARTED_RU.md)
