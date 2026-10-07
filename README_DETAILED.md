# Harbor Browser - Complete Guide

> **English Version** | [Русская версия](./README_RU_DETAILED.md)

## 📖 Table of Contents

1. [About Harbor](#about-harbor)
2. [Quick Start](#quick-start)
3. [Features](#features)
4. [System Requirements](#system-requirements)
5. [Installation](#installation)
6. [Usage](#usage)
7. [Configuration](#configuration)
8. [Development](#development)
9. [Contributing](#contributing)
10. [Support](#support)
11. [License](#license)

---

## About Harbor

**Harbor Browser** is an independent, open-source Firefox-based web browser with innovative user interface features and extensive customization capabilities.

### Key Highlights

- 🎯 **Independent** - Completely separate from other browser projects
- 🔒 **Secure** - Built on Firefox's proven security foundation
- 🎨 **Customizable** - CSS-based theming system with mods
- 🚀 **Fast** - Optimized performance for modern web
- 🌍 **Cross-Platform** - Windows, macOS, and Linux support
- 🗣️ **Multilingual** - 30+ language support
- 👥 **Open Source** - MPL-2.0 licensed, community-driven

### What Makes Harbor Different?

Harbor introduces several innovative features:

- **Spaces** - Organize tabs into isolated workspaces
- **Split View** - Browse two pages side-by-side
- **Live Folders** - Dynamic folders from GitHub/RSS
- **Advanced Tabs** - Groups, pinning, vertical sidebar
- **Mods System** - Customize UI with CSS
- **Sessions** - Auto-save and restore browsing sessions

---

## Quick Start

### Download & Install

**Windows:**
```bash
# Download from GitHub Releases
https://github.com/Ivantech123/Harbor/releases

# Run installer
harbor-windows.exe

# Or use portable version
harbor-windows-portable.zip
```

**macOS:**
```bash
# Download DMG
harbor-macos.dmg

# Or via Homebrew
brew install harbor
```

**Linux:**
```bash
# Download AppImage
wget https://github.com/Ivantech123/Harbor/releases/download/latest/harbor-linux.AppImage
chmod +x harbor-linux.AppImage
./harbor-linux.AppImage

# Or via package manager
sudo apt install harbor-browser  # Ubuntu/Debian
sudo dnf install harbor-browser  # Fedora
```

### First Steps

1. **Launch Harbor** from your applications
2. **Set as default browser** (optional but recommended)
3. **Explore features** in Settings
4. **Customize** appearance and behavior
5. **Install extensions** from Firefox marketplace

---

## Features

### Core Features

#### 🎯 Spaces
Organize your browsing into isolated workspaces:
- Each space has independent tabs
- Separate bookmarks and history
- Quick switching between spaces
- Perfect for project-based workflows

#### 📄 Split View
View multiple pages simultaneously:
- Side-by-side comparison
- Drag-and-drop between views
- Synchronized scrolling (optional)
- Great for research and multitasking

#### 📑 Advanced Tab Management
Sophisticated tab organization:
- **Tab Groups** - Group related tabs
- **Pinned Tabs** - Keep important tabs visible
- **Vertical Sidebar** - Compact tab display
- **Quick Search** - Find tabs instantly
- **Auto-Save** - Sessions saved automatically

#### 📁 Live Folders
Dynamic folders that update automatically:
- **GitHub Integration** - Monitor repositories
- **RSS Feeds** - Subscribe to content
- **Smart Bookmarks** - Auto-organized bookmarks
- **Custom Scripts** - Create your own live folders

#### 🎨 Customization
Extensive UI customization:
- **Mods System** - CSS-based theming
- **Theme Support** - Light, dark, and custom
- **Color Schemes** - Hundreds of color options
- **Font Control** - Choose fonts and sizes
- **Layout Options** - Customize toolbar and UI

### Additional Features

- 🔐 **Privacy Mode** - Browse without history
- 🔖 **Bookmarks** - Organize and sync
- 📜 **History** - Track your browsing
- 🔍 **Search** - Multiple search engines
- 📥 **Downloads** - Download management
- 🔧 **Developer Tools** - Full debugging support
- ⚙️ **Settings** - Extensive preferences
- 🔄 **Sync** - Cross-device synchronization
- 📱 **Responsive** - Adaptive UI for all screen sizes

---

## System Requirements

### Minimum Requirements

| OS | Version | RAM | Storage |
|----|---------|-----|---------|
| Windows | 10 or later | 4GB | 500MB |
| macOS | 10.15 or later | 4GB | 500MB |
| Linux | Ubuntu 20.04+ | 4GB | 500MB |

### Recommended Requirements

| OS | Version | RAM | Storage |
|----|---------|-----|---------|
| Windows | 11 | 8GB | 1GB SSD |
| macOS | 12+ | 8GB | 1GB SSD |
| Linux | Ubuntu 22.04+ | 8GB | 1GB SSD |

### Additional

- **Processor:** Modern multi-core processor (Intel/AMD/ARM)
- **Internet:** Required for web browsing and updates
- **Display:** 1024x768 minimum resolution

---

## Installation

### Windows Installation

#### Method 1: Installer (Recommended)
1. Download `harbor-windows.exe` from [Releases](https://github.com/Ivantech123/Harbor/releases)
2. Double-click the installer
3. Follow the installation wizard
4. Choose installation location
5. Select start menu shortcuts
6. Click Install
7. Launch Harbor

#### Method 2: Portable Version
1. Download `harbor-windows-portable.zip`
2. Extract to desired location
3. No installation needed
4. Run `harbor.exe` directly

#### Method 3: Microsoft Store
1. Search "Harbor Browser" in Microsoft Store
2. Click Install
3. Wait for download and installation
4. Launch from Start Menu

### macOS Installation

#### Method 1: DMG Installer
1. Download `harbor-macos.dmg` from [Releases](https://github.com/Ivantech123/Harbor/releases)
2. Double-click `harbor-macos.dmg`
3. Drag Harbor.app to Applications folder
4. Eject the disk image
5. Open Applications folder
6. Double-click Harbor.app

#### Method 2: Homebrew
```bash
brew tap Ivantech123/harbor
brew install harbor
```

#### Method 3: Command Line
```bash
cd /Applications
open Harbor.app
```

### Linux Installation

#### Method 1: AppImage
```bash
# Download
wget https://github.com/Ivantech123/Harbor/releases/latest/download/harbor-linux.AppImage

# Make executable
chmod +x harbor-linux.AppImage

# Run
./harbor-linux.AppImage

# Optional: Move to bin directory
sudo mv harbor-linux.AppImage /usr/local/bin/harbor
```

#### Method 2: Package Manager

**Ubuntu/Debian:**
```bash
sudo add-apt-repository ppa:ivantech123/harbor
sudo apt update
sudo apt install harbor-browser
```

**Fedora:**
```bash
sudo dnf copr enable ivantech123/harbor
sudo dnf install harbor-browser
```

**Arch:**
```bash
yay -S harbor-browser
```

#### Method 3: Flatpak
```bash
flatpak install flathub app.ivantech123.Harbor
flatpak run app.ivantech123.Harbor
```

---

## Usage

### Basic Navigation

| Action | Keyboard | Mouse |
|--------|----------|-------|
| New Tab | Ctrl+T | Menu → New Tab |
| New Window | Ctrl+N | Menu → New Window |
| Close Tab | Ctrl+W | Middle-click tab |
| Reopen Tab | Ctrl+Shift+T | Right-click close |
| Back | Alt+← | Back button |
| Forward | Alt+→ | Forward button |
| Reload | Ctrl+R | Reload button |
| Stop | Esc | Stop button |

### Spaces

**Creating Spaces:**
1. Click "+" button in Spaces sidebar
2. Name your space
3. Customize appearance
4. Start adding tabs

**Switching Spaces:**
- Click space name in sidebar
- Use keyboard shortcut (customizable)
- Swipe gesture (macOS trackpad)

### Split View

**Enabling Split View:**
1. Click Split View button in toolbar
2. Select tabs for each side
3. Browse independently
4. Drag between sides to resize

**Exiting Split View:**
- Click "X" on Split View panel
- Click full-width button in toolbar

### Mods & Customization

**Installing Mods:**
1. Settings → Mods
2. Browse available mods
3. Click "Install"
4. Restart browser

**Creating Custom Mods:**
1. Settings → Mods
2. Click "Create Mod"
3. Edit CSS
4. Apply and preview
5. Save mod

---

## Configuration

### Settings Overview

**General**
- Startup behavior
- Homepage settings
- Default search engine
- Download preferences

**Privacy & Security**
- Cookie settings
- History retention
- Site permissions
- HTTPS enforcement

**Appearance**
- Theme selection
- Color scheme
- Font settings
- Sidebar visibility

**Performance**
- Memory limits
- Cache settings
- Startup optimization
- Background processing

**Mods**
- Manage installed mods
- Create new mods
- CSS editor
- Preview changes

---

## Development

### Building from Source

**Prerequisites:**
- Node.js 18+
- Python 3.10+
- Rust (latest stable)
- Git
- Platform SDK (Windows/macOS/Linux specific)

**Setup:**
```bash
# Clone repository
git clone https://github.com/Ivantech123/Harbor.git
cd Harbor

# Install dependencies
npm install

# Prepare environment
npm run init

# Start development version
npm start
```

**Build:**
```bash
# Build for all platforms
npm run build

# Build UI only
npm run build:ui

# Package for distribution
npm run package
```

### Development Commands

```bash
npm start          # Run development version
npm run build      # Build for all platforms
npm run lint       # Check code style
npm run lint:fix   # Fix linting issues
npm test           # Run tests
npm run test:dbg   # Debug tests
```

---

## Contributing

### Report Bugs
- [GitHub Issues](https://github.com/Ivantech123/Harbor/issues)
- Include reproduction steps
- Specify OS and version
- Attach screenshots if relevant

### Request Features
- [GitHub Discussions](https://github.com/Ivantech123/Harbor/discussions)
- Describe use case
- Suggest implementation
- Vote on existing requests

### Submit Code
1. Fork repository
2. Create feature branch
3. Make changes following guidelines
4. Submit Pull Request
5. Address review feedback

**See [Contributing Guide](./docs/contribute.md) for details.**

---

## Support

### Documentation
- [Getting Started](./docs/GETTING_STARTED.md)
- [Features Guide](./docs/FEATURES.md)
- [FAQ](./docs/FAQ.md)
- [Troubleshooting](./docs/TROUBLESHOOTING.md)

### Community
- [GitHub Issues](https://github.com/Ivantech123/Harbor/issues)
- [GitHub Discussions](https://github.com/Ivantech123/Harbor/discussions)
- [Discord](https://discord.gg/harbor) (if available)

### Resources
- [Official Website](https://harbor.example.com)
- [Firefox Documentation](https://firefox-source-docs.mozilla.org/)
- [Mozilla Developer](https://developer.mozilla.org/)

---

## License

Harbor Browser is licensed under the **Mozilla Public License 2.0** (MPL-2.0).

This means:
- ✅ Free to use and distribute
- ✅ Open source code
- ✅ Can modify for personal use
- ✅ Must share modifications
- ✅ Patent protection included

**[View Full License](./LICENSE)**

---

## Acknowledgments

Harbor Browser is built on:
- **Firefox** - Core browser engine
- **Mozilla Foundation** - Security and standards
- **Open Source Community** - Contributions and support

---

## FAQ

**Q: Is Harbor free?**  
A: Yes, completely free and open source.

**Q: Can I sync data?**  
A: Yes, bookmarks, history, and passwords across devices.

**Q: Is it safe?**  
A: Yes, based on Firefox's proven security model.

**Q: Can I use Firefox extensions?**  
A: Most are compatible, check before installing.

**Q: Where is my data stored?**  
A: Locally on your device, synced only if enabled.

**[More FAQ](./docs/FAQ.md)**

---

## Version History

**Current Version:** 1.0.0  
**Firefox Base:** 156.0.1  
**Release Date:** 2026-10-08

**[View Changelog](./CHANGELOG.md)**

---

## Project Status

- ✅ **Stable** - Production ready
- ✅ **Active Development** - Regular updates
- ✅ **Community Supported** - Open to contributions
- ✅ **Open Source** - Full transparency

---

## Contact

- **Issues:** [GitHub Issues](https://github.com/Ivantech123/Harbor/issues)
- **Discussions:** [GitHub Discussions](https://github.com/Ivantech123/Harbor/discussions)
- **Email:** [Contact](mailto:contact@harbor.example.com)
- **Security:** [SECURITY.md](./docs/SECURITY.md)

---

**Harbor Browser** - A modern, independent, and powerful web browser.

🚀 **[Download Now](https://github.com/Ivantech123/Harbor/releases)** | 📖 **[Documentation](./docs/README.md)** | 🤝 **[Contribute](./docs/contribute.md)**

---

**Language:** English | [Русский](./README_RU_DETAILED.md)

*Last Updated: 2026-10-08*
