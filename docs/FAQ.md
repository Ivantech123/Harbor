# Frequently Asked Questions (FAQ)

> [Русская версия](./FAQ_RU.md)

## General Questions

### What is Harbor Browser?
Harbor is an independent Firefox-based browser with innovative UI features, including custom spaces, split-view browsing, advanced tab management, and extensive customization options.

### Is Harbor free?
Yes! Harbor is completely free and open-source under the MPL-2.0 license.

### Is Harbor safe to use?
Harbor inherits Firefox's security features and receives the same security updates. We recommend keeping Harbor updated to the latest version.

### Can I sync data with other devices?
Yes! Harbor supports sync for bookmarks, history, passwords, and settings. Sign in with your account to enable sync.

### Does Harbor track my activity?
No. Harbor respects your privacy. We don't track browsing activity or collect personal data.

## Technical Questions

### Why is Harbor based on Firefox?
Firefox provides a solid foundation with:
- Strong security model
- Multi-platform support
- Large codebase with proven reliability
- Active security updates

### Is Harbor compatible with Firefox extensions?
Most Firefox extensions are compatible, but some features may differ. Check the extension's compatibility before installing.

### Can I use my Firefox profile?
Yes, you can import your Firefox profile to Harbor. Check Settings for import options.

### What are system requirements?
- Windows 10+, macOS 10.15+, or Linux
- 4GB RAM minimum (8GB recommended)
- 500MB disk space
- Modern processor

## Features Questions

### What is Spaces?
Spaces are isolated workspaces where you can organize tabs. Each space has its own tab set, bookmarks sidebar, and can be customized independently.

### How do I use Split View?
Click the Split View icon in the toolbar or use keyboard shortcut. Then select which tab to show on each side.

### Can I customize the UI?
Yes! Harbor includes a mods system for CSS-based customization. Visit Settings → Mods to manage themes and customizations.

### What are Live Folders?
Live Folders are dynamic folders that automatically update with content from sources like GitHub repositories or RSS feeds.

### Can I group tabs?
Yes! Right-click on a tab and select "Add to group" to create tab groups for better organization.

## Update & Channels

### How often does Harbor update?
Harbor typically releases updates monthly. Check About Harbor for the latest version.

### What's the Twilight channel?
Twilight is Harbor's testing channel featuring RC Firefox versions and experimental features. More frequent updates but potentially less stable.

### Can I switch between channels?
Yes, in Settings → About you can switch between Release (stable) and Twilight (testing).

### What if I find a bug?
Report it on [GitHub Issues](https://github.com/Ivantech123/Harbor/issues) with reproduction steps.

## Performance & Troubleshooting

### Why is Harbor using high CPU/memory?
- Check if too many tabs are open
- Disable unused extensions
- Clear browsing data
- Try safe mode

### Harbor is slow on startup
- Check startup performance in Settings
- Reduce number of startup pages
- Disable background tabs restoration
- Clear browsing cache

### What if Harbor crashes?
1. Check for updates
2. Try safe mode
3. Clear profile (Settings → Advanced)
4. Reinstall Harbor
5. Report on GitHub if issue persists

### How do I clear browsing data?
Settings → Privacy & Security → Clear Data. Choose what to delete and time range.

## Security & Privacy

### Does Harbor use VPN?
No, Harbor doesn't include VPN. Use a separate VPN service if needed.

### Can I browse anonymously?
Yes, use Private Browsing mode (Ctrl+Shift+P or Cmd+Shift+P).

### Is HTTPS required?
HTTPS is preferred for security but not required. You'll see a warning for non-HTTPS sites.

### How do I report security issues?
See [SECURITY.md](./SECURITY.md) for responsible disclosure procedures.

## Advanced Topics

### How do I enable developer mode?
Press F12 to open Developer Tools. See [Features Guide](./FEATURES.md) for details.

### Can I automate Harbor?
Yes, through various methods:
- User scripts and extensions
- Command-line parameters
- Mods system for UI automation

### What profiles are available?
Harbor supports multiple user profiles. Each can have separate settings, bookmarks, and history.

### Where is my profile folder?
- Windows: `C:\Users\[username]\AppData\Roaming\Harbor`
- macOS: `~/Library/Application Support/Harbor`
- Linux: `~/.config/harbor` or `~/.harbor`

## Contributing & Support

### Can I contribute to Harbor?
Yes! See [Contributing Guide](./contribute.md) for details on reporting bugs, suggesting features, or submitting code.

### How do I report a feature request?
Suggest features on [GitHub Discussions](https://github.com/Ivantech123/Harbor/discussions).

### Where can I get support?
- [Documentation](./README.md)
- [GitHub Issues](https://github.com/Ivantech123/Harbor/issues)
- [GitHub Discussions](https://github.com/Ivantech123/Harbor/discussions)
- [Troubleshooting Guide](./TROUBLESHOOTING.md)

### Who maintains Harbor?
Harbor is maintained by an open-source community. See contributors list on GitHub.

## Uninstall & Migration

### How do I uninstall Harbor?
- Windows: Settings → Apps → Uninstall
- macOS: Drag to Trash from Applications
- Linux: Use package manager

### Can I migrate to Firefox?
Yes, export bookmarks and history from Harbor's settings before uninstalling.

### Will I lose my data?
Your profile data is preserved. You can always re-import or copy it to another browser.

---

**Tips & Tricks**

1. **Keyboard Shortcuts** - See [Getting Started Guide](./GETTING_STARTED.md#keyboard-shortcuts)
2. **Mods** - Create custom CSS mods for UI changes
3. **Sessions** - Harbor automatically saves sessions
4. **Profiles** - Use multiple profiles for different purposes
5. **Extensions** - Install compatible Firefox extensions

**Still have questions?**
- Check [Troubleshooting Guide](./TROUBLESHOOTING.md)
- Ask on [GitHub Discussions](https://github.com/Ivantech123/Harbor/discussions)
- Create an [Issue](https://github.com/Ivantech123/Harbor/issues) if it's a bug

---

**Language:** English | [Русский](./FAQ_RU.md)
