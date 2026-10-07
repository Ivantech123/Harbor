# Harbor Browser - Release Process

This document outlines the complete release process for Harbor Browser.

## Release Cadence

- **Release Channel:** Monthly (approximately)
- **Twilight Channel:** Bi-weekly or as needed
- **Hotfixes:** As needed for critical issues

## Version Numbering

Harbor uses **Semantic Versioning** (MAJOR.MINOR.PATCH):

- **MAJOR** (1.x.0) - Major feature releases, breaking changes
- **MINOR** (x.1.0) - New features, improvements
- **PATCH** (x.x.1) - Bug fixes, security patches

## Pre-Release Planning

### 2 Weeks Before Release

1. **Communication:**
   - Announce planned release on Discussions
   - List tentative features/fixes
   - Request community feedback

2. **Feature Freeze:**
   - Stop merging new features to `master`
   - Only bugfixes and improvements allowed
   - Focus on stability

3. **Firefox Sync Check:**
   - Check for new Firefox versions
   - Plan Firefox base version for release
   - Test with new Firefox version if available

### 1 Week Before Release

1. **Create Release Branch:**
   ```bash
   git checkout main
   git pull origin main
   git checkout -b release/v1.1.0
   ```

2. **Update Version Files:**
   - `package.json` - version field
   - `surfer.json` - displayVersion fields
   - `.version` file if exists

3. **Update Documentation:**
   - `CHANGELOG.md` - Add new version section
   - List all changes (features, fixes, improvements)
   - Note Firefox version being used

4. **Create Pull Request:**
   - Target: `main`
   - Title: `Release: v1.1.0`
   - Description: Summary of changes

## Release Testing Phase (3-5 days)

### Automated Testing
```bash
npm run test              # Run full test suite
npm run lint              # Check code style
npm run build             # Build for all platforms
```

### Manual Testing Checklist

#### Windows
- [ ] Installer works
- [ ] Launch and basic functionality
- [ ] Spaces switching
- [ ] Tab management
- [ ] Split view
- [ ] Settings/preferences
- [ ] Update check

#### macOS
- [ ] DMG installer
- [ ] Launch and functionality
- [ ] M1/M2 (native)
- [ ] Intel (if supported)
- [ ] Trackpad gestures

#### Linux
- [ ] AppImage runs
- [ ] Snap/Flatpak (if applicable)
- [ ] Desktop integration
- [ ] System tray/notifications

#### Features
- [ ] Live folders (GitHub, RSS)
- [ ] Theme/mod installation
- [ ] Share feature
- [ ] Session restore
- [ ] Bookmarks sync
- [ ] History functionality
- [ ] Downloads manager
- [ ] Print functionality

#### Performance
- [ ] Startup time acceptable
- [ ] Memory usage normal
- [ ] CPU usage on idle
- [ ] Smooth animations

### Bug Triage
- Fix critical/high priority bugs
- Re-test fixes
- Update PR as needed

## Release Preparation

### Finalization (2 days before)

1. **Final Code Review:**
   - All changes reviewed and approved
   - No outstanding issues

2. **Release Notes:**
   - Create detailed release notes
   - Link to GitHub releases
   - Highlight major features

3. **Build Artifacts:**
   - Build for all platforms
   - Generate checksums (SHA256)
   - Create signatures if applicable

4. **Final QA:**
   - Download and test builds
   - Verify file integrity
   - Check platform-specific features

### Merge and Tag

1. **Merge to Main:**
   ```bash
   # PR is approved and merged to main
   # This triggers automated build/release workflows
   ```

2. **Create Git Tag:**
   ```bash
   git checkout main
   git pull origin main
   git tag -a v1.1.0 -m "Release version 1.1.0"
   git push origin v1.1.0
   ```

3. **Merge to Master:**
   ```bash
   git checkout master
   git pull origin master
   git merge --no-ff main -m "Merge release v1.1.0 into master"
   git push origin master
   ```

## Release Day

### 1. GitHub Release

1. **Create Release:**
   - Go to GitHub Releases
   - Click "New Release"
   - Select tag: `v1.1.0`
   - Title: `Harbor v1.1.0`
   - Description: Copy from CHANGELOG.md

2. **Attach Artifacts:**
   - Windows installer (.exe, .msi)
   - Windows portable (.zip)
   - macOS DMG (.dmg)
   - Linux AppImage (.appimage)
   - Checksums file (SHA256.txt)

3. **Publish Release:**
   - Set as latest release
   - Save and publish

### 2. Website Update

1. Update download page
2. Update version number
3. Add release notes link
4. Update feature list if changed

### 3. Community Announcement

1. **GitHub Discussions:**
   - Create release announcement
   - List highlights
   - Link to full changelog

2. **Social Media (if applicable):**
   - Tweet/post about release
   - Include key features
   - Link to download

3. **Issue Updates:**
   - Close resolved issues
   - Thank contributors
   - Link issues to release

## Post-Release

### Monitoring (First Week)

1. **Monitor Issues:**
   - Watch for bug reports
   - Severity assessment
   - Prioritize critical issues

2. **User Feedback:**
   - Check discussions
   - Respond to questions
   - Gather feedback

3. **Metrics:**
   - Track downloads
   - Monitor error reports
   - Check performance metrics

### Hotfix Decisions

If critical issues found:

1. **Assess Severity:**
   - Does it affect core functionality?
   - How many users affected?
   - Can users work around it?

2. **Create Hotfix:**
   ```bash
   git checkout main
   git checkout -b hotfix/v1.1.1
   # Fix the issue
   git commit -m "fix(scope): description"
   ```

3. **Release Hotfix:**
   - Follow same process as release
   - Use version v1.1.1
   - Announce as hotfix

## Twilight Release Process

Twilight (testing channel) releases are similar but:

1. **More frequent:** Can release weekly/bi-weekly
2. **Less testing:** Can use RC Firefox versions
3. **Experimental:** Features may change
4. **Tag format:** `v1.23t`, `v1.24t`, etc.

## Long-Term Support (LTS)

For LTS versions:
- Commit to security patches for 12 months
- Bug fixes for critical issues
- No major feature backports
- Clearly mark as LTS

## Release Archive

Maintain releases by:
1. Keeping GitHub release pages updated
2. Archive old releases in storage
3. Maintain checksums for verification
4. Keep CHANGELOG.md current

## Troubleshooting

### Build fails during release?
1. Check CI logs
2. Fix the issue on release branch
3. Re-run build
4. Create new tag if needed

### Wrong version tagged?
1. Delete tag locally: `git tag -d v1.1.0`
2. Delete tag remote: `git push origin -d v1.1.0`
3. Create correct tag

### Need to pull back a release?
1. Delete GitHub release
2. Delete git tag
3. Create hotfix for critical issues

## Release Checklist

```markdown
## Pre-Release
- [ ] Feature freeze implemented
- [ ] Firefox version finalized
- [ ] Release branch created
- [ ] Version numbers updated
- [ ] CHANGELOG.md updated
- [ ] Release notes prepared

## Testing
- [ ] All tests passing
- [ ] Windows testing complete
- [ ] macOS testing complete
- [ ] Linux testing complete
- [ ] Feature testing complete
- [ ] Performance acceptable

## Release
- [ ] Code merged to main
- [ ] Git tag created
- [ ] GitHub release created
- [ ] Artifacts uploaded
- [ ] Website updated
- [ ] Announcement posted

## Post-Release
- [ ] Issues monitored
- [ ] Bug reports triaged
- [ ] User feedback collected
- [ ] Hotfix assessment done
```

## Contact & Questions

- GitHub Issues: [Report bugs](https://github.com/Ivantech123/Harbor/issues)
- Discussions: [Ask questions](https://github.com/Ivantech123/Harbor/discussions)
- Release planning: Discuss in GitHub Discussions
