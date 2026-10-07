# Harbor Browser - Version Strategy

## Overview

Harbor Browser uses **Semantic Versioning** (SemVer) with alignment to Firefox ESR versions.

## Version Format

```
MAJOR.MINOR.PATCH[-PRERELEASE][+BUILD]

Examples:
1.0.0          - Release version 1.0.0
1.0.1          - Patch release
1.1.0          - Minor release with new features
2.0.0          - Major release with breaking changes
1.23t          - Twilight testing channel (special format)
```

## Version Components

### MAJOR
Incremented when:
- Major UI redesign
- Significant architecture changes
- Breaking changes for extensions/mods
- Major feature overhaul

**Examples:** 1.0.0 → 2.0.0

### MINOR
Incremented when:
- New features added
- Significant improvements
- Firefox base version updates
- UI enhancements

**Examples:** 1.0.0 → 1.1.0

### PATCH
Incremented when:
- Bug fixes
- Performance improvements
- Security patches
- Minor enhancements

**Examples:** 1.0.0 → 1.0.1

## Channel Naming

### Release Channel
- Stable, production-ready
- Format: `MAJOR.MINOR.PATCH`
- Example: `1.0.0`, `1.0.1`, `1.1.0`
- Firefox: Stable versions
- Cadence: Monthly (approximately)

### Twilight Channel
- Testing/RC channel
- Format: `MAJOR.MINORt` or `MAJOR.MINOR.PATCHt`
- Example: `1.23t`, `1.24t`, `1.0.1t`
- Firefox: RC or Beta versions
- Cadence: Bi-weekly
- Note: "t" suffix indicates Twilight

### Development
- Unreleased code
- Version: Next planned version (e.g., 1.1.0-dev)
- Branch: `master`
- Status: May be unstable

## Firefox Coordination

Harbor is tied to Firefox releases:

| Harbor Version | Firefox Base | Release Date |
|---|---|---|
| 1.0.0 | 156.0.1 | 2026-10-08 |
| 1.0.1 | 156.0.1 | 2026-10-15 |
| 1.1.0 | 157.0 | 2026-11-08 |
| 1.23t | 156.0.1 RC | 2026-10-15 |

### Update Cadence

When Firefox releases:
1. Track new Firefox version
2. Sync Firefox source
3. Test Harbor with new Firefox
4. Plan Harbor release
5. Release within 1-2 weeks

## Pre-Release Versions

For beta/RC testing:

```
1.0.0-alpha.1    - Alpha testing
1.0.0-beta.1     - Beta testing
1.0.0-rc.1       - Release candidate
1.0.0            - Final release
```

Used for:
- Early testing
- Feature validation
- Community feedback
- Pre-release builds

## Build Metadata

For CI/build tracking (optional):

```
1.0.0+build.12345    - Build number
1.0.0+2026.10.08     - Date-based
1.0.0+abc123         - Commit hash prefix
```

Not used in normal version strings, only for build tracking.

## Version History

```
1.0.0 (2026-10-08)
  ├─ Initial independent release
  ├─ Firefox 156.0.1 base
  └─ Full Harbor feature set

1.0.1 (2026-10-15)
  ├─ Bug fixes
  ├─ Performance improvements
  └─ Firefox 156.0.1 patch

1.1.0 (2026-11-08)
  ├─ New features
  ├─ UI improvements
  ├─ Firefox 157.0 base
  └─ Stability enhancements

1.23t (2026-10-15) [Twilight]
  ├─ Testing channel
  ├─ New experimental features
  └─ Firefox 156.0.1 RC

2.0.0 (TBD - Future)
  ├─ Major redesign
  ├─ Architecture changes
  └─ Breaking changes
```

## Compatibility

### Within Minor Version
- `1.0.0` → `1.0.5` Compatible
- Mods, extensions work
- Settings preserved
- No breaking changes

### Major Version
- `1.x.x` → `2.0.0` May have breaking changes
- Mods may need updates
- Extensions may require changes
- Migration guide provided

### Between Channels
- Release ↔ Twilight: May differ
- Users can switch
- Settings preserved
- Same Firefox base versions compatible

## LTS (Long-Term Support)

Future LTS versions will:
- Receive updates for 12 months minimum
- Security patches for critical issues
- Bug fixes for regressions
- No major feature additions
- Clear LTS marking in version

Format: `1.0.0-LTS`

## Release Timing

- **Release:** 1st week of month (approximate)
- **Twilight:** 2nd & 4th week
- **Hotfixes:** As needed
- **Schedule:** May shift based on Firefox releases

## Version Communication

### In Browser
- About Harbor dialog shows version
- Update notifications include new version
- Crash reports include version

### In Code
- `package.json` - npm version
- `surfer.json` - displayVersion
- `manifest.json` - browser version

### Documentation
- README.md
- CHANGELOG.md
- GitHub releases
- Website downloads page

## Future Versioning

### Next Major (2.0.0)
Planned for: TBD
- UI redesign
- New architecture
- Major feature set

### LTS Strategy
- Decide after 1.x.x stabilization
- Likely every 6 months
- 12-month support window

### Extended Support
- Security patches only
- No feature backports
- Clear communication

## Decision Making

Version bumps decided by:
1. Core maintainers
2. Feature scope assessment
3. Firefox base version changes
4. Community feedback
5. Changelog review

For questions about versioning:
- Open GitHub issue
- Discuss in GitHub Discussions
- Check CHANGELOG.md
