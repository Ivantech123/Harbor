# Harbor Browser - Changelog

All notable changes to Harbor Browser will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-10-08

### Added
- **Independent Harbor Browser Release** - First fully independent release
  - Complete Firefox 156.0.1 fork with Harbor branding
  - Custom UI framework with spaces, split-view, and modular design
  - Advanced tab management and window customization
  - Live folders integration (GitHub, RSS feeds)
  - Theme customization system with CSS mods
  - Localization support for 30+ languages
  - Privacy-focused browsing features
  - Multi-OS support (Windows, macOS, Linux)

### Features
- **Spaces** - Organize tabs into isolated workspaces
- **Split View** - Side-by-side browsing capabilities
- **Live Folders** - Dynamic folder system for organizing bookmarks
- **Custom Mods** - CSS-based theme and UI customization
- **Advanced Tabs** - Vertical tab sidebar, tab groups, pinning
- **GitHub Integration** - Live folder provider for GitHub
- **Sessions Management** - Automatic session persistence
- **Command Palette** - Quick command access
- **Compact Mode** - Space-efficient UI option
- **Glance** - Quick preview feature for web content
- **Share Feature** - Share browsing sessions securely

### Technical
- Based on Firefox 156.0.1
- Built with Surfer build system
- Full localization infrastructure
- Cross-platform support
- Modular architecture for easy customization

## [1.23t] - 2026-10-08

### Added
- **Twilight Channel** - Testing/RC version
- Built on Firefox RC 156.0.1
- Experimental features testing

---

## Release Schedule

| Version | Release Date | Status | Firefox Base |
|---------|-------------|--------|-------------|
| 1.0.0 | 2026-10-08 | Latest | 156.0.1 |
| 1.23t | 2026-10-08 | Testing | 156.0.1 RC |

## Versioning

Harbor Browser uses **Semantic Versioning**:
- **MAJOR** - Major feature releases, UI overhauls
- **MINOR** - New features, significant improvements
- **PATCH** - Bug fixes, security patches

## Channel Descriptions

### Release (Stable)
- Production-ready version
- Thoroughly tested features
- Regular security updates
- Recommended for general users

### Twilight (Testing)
- Testing channel with new features
- RC Firefox versions
- Experimental functionality
- For power users and testers

## Firefox Updates

When Firefox receives security updates or new versions:
1. Harbor sync process automatically tracks updates
2. New Firefox version is integrated and tested
3. Release is prepared with synced Firefox version
4. Users notified of availability

## Reporting Issues

Found a bug? Report it on [GitHub Issues](https://github.com/Ivantech123/Harbor/issues)

Feature requests? Use [GitHub Discussions](https://github.com/Ivantech123/Harbor/discussions)

## Contributing

Interested in contributing? Check out [CONTRIBUTING.md](./docs/contribute.md)
