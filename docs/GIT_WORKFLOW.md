# Harbor Browser - Git Workflow Guide

This document describes the Git workflow and branching strategy for Harbor Browser development.

## Branch Strategy

Harbor uses a modified Git Flow model with the following branches:

### Main Branches

#### `main` (Production)
- **Purpose:** Production-ready code
- **Protection:** Branch protection enabled
- **Merges:** Only from release branches and hotfixes
- **Tags:** Version tags (v1.0.0, v1.0.1, etc.)

#### `master` (Development)
- **Purpose:** Integration branch for features
- **Default branch:** Yes
- **Merges:** From feature and bugfix branches
- **Status:** Pre-release code, may be unstable

#### `release` (Release Branch)
- **Purpose:** Prepare releases
- **Pattern:** `release/*`
- **Merges:** Bug fixes only, then to main and master
- **Lifecycle:** Created for final testing, merged to main

#### `twilight` (Testing/RC)
- **Purpose:** Testing channel with RC Firefox versions
- **Status:** Experimental features
- **Release frequency:** More frequent than Release

### Feature Branches

#### Pattern: `feature/*`
```
feature/spaces-improvements
feature/add-split-view
feature/theme-store-integration
```

**Rules:**
- Branch from: `master`
- Merge back to: `master` (via PR)
- Naming: Use lowercase, hyphens for spaces
- Lifetime: Delete after merge

#### Pattern: `bugfix/*`
```
bugfix/tab-crash-fix
bugfix/memory-leak-session-store
bugfix/share-service-timeout
```

**Rules:**
- Branch from: `master`
- Merge back to: `master` (via PR)
- Priority: Higher than features
- Prefix: `bugfix/` for regular bugs, `hotfix/` for critical

#### Pattern: `hotfix/*`
```
hotfix/security-patch
hotfix/critical-crash
```

**Rules:**
- Branch from: `main`
- Merge back to: `main` AND `master`
- Priority: Highest
- Requires: Immediate code review

## Commit Message Guidelines

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
type(scope): subject

body (optional)

footer (optional)
```

### Types
- `feat` - New feature
- `fix` - Bug fix
- `perf` - Performance improvement
- `refactor` - Code refactoring
- `test` - Adding/updating tests
- `docs` - Documentation changes
- `style` - Code style/formatting
- `chore` - Build, dependencies, tooling
- `ci` - CI/CD configuration
- `revert` - Revert previous commit

### Scopes
- `ui` - User interface
- `spaces` - Spaces feature
- `tabs` - Tab management
- `mods` - Customization/theming
- `share` - Share feature
- `live-folders` - Live folders feature
- `build` - Build system
- `prefs` - Preferences/settings
- `l10n` - Localization
- `ci` - CI/CD

### Examples

```
feat(spaces): add drag-and-drop between spaces

Implement drag-and-drop functionality to move tabs between spaces.
Includes smooth animations and visual feedback.

Closes #123
```

```
fix(tabs): prevent crash when closing multiple tabs

Apply proper cleanup when closing multiple tabs in sequence.
Fixes memory leak in tab lifecycle.

Fixes #456
```

```
perf(ui): optimize space switching animation

Reduce animation frames and improve rendering performance.
Performance test shows 30% improvement in switching speed.
```

## Pull Request Process

### Creating a PR

1. **Branch from:** `master` for features/bugfixes, `main` for hotfixes
2. **Branch naming:** Follow conventions above
3. **Commit messages:** Use conventional commits
4. **Keep updated:** Rebase before creating PR
5. **Squash if needed:** Clean up history before merging

### PR Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] New feature
- [ ] Bug fix
- [ ] Performance improvement
- [ ] Documentation update

## Related Issues
Closes #123

## Testing
- [ ] Tested on Windows
- [ ] Tested on macOS
- [ ] Tested on Linux
- [ ] Unit tests added/updated

## Checklist
- [ ] Code follows style guidelines
- [ ] Commit messages follow conventions
- [ ] No breaking changes
- [ ] Documentation updated
```

### Review Requirements

- **Minimum reviewers:** 1
- **Approval:** Required before merge
- **Status checks:** All CI tests must pass
- **Conversations:** All must be resolved
- **Branch updates:** Must be up-to-date with base branch

### Merging

- **Merge strategy:** Squash and merge (for features)
- **Release branches:** Create merge commit
- **Hotfixes:** Create merge commit
- **Delete branch:** After merge

## Release Workflow

### Preparing a Release

1. **Create release branch:**
   ```bash
   git checkout -b release/v1.0.1
   ```

2. **Update version:**
   - Update `package.json` version
   - Update `CHANGELOG.md`
   - Update build configuration

3. **Create PR** to `main`

4. **Testing phase:**
   - Run full test suite
   - Build for all platforms
   - Smoke testing

5. **Merge to main** (with merge commit)

6. **Tag release:**
   ```bash
   git tag -a v1.0.1 -m "Release version 1.0.1"
   git push origin v1.0.1
   ```

7. **Merge back to master:**
   ```bash
   git checkout master
   git merge --no-ff main
   ```

## Common Workflows

### Creating a Feature

```bash
# Update master
git checkout master
git pull origin master

# Create feature branch
git checkout -b feature/my-feature

# Make changes and commit
git add .
git commit -m "feat(scope): description"

# Push to remote
git push -u origin feature/my-feature

# Create Pull Request on GitHub
```

### Updating PR with Latest Changes

```bash
# Fetch latest master
git fetch origin master

# Rebase onto master
git rebase origin/master

# Force push (only for your branches)
git push origin feature/my-feature -f
```

### Fixing a Commit Message

```bash
# For last commit (not yet pushed)
git commit --amend -m "new message"

# For pushed commits (use with caution)
git rebase -i HEAD~n
# Mark commits as 'reword'
# Edit messages
git push origin branch-name -f
```

### Creating a Hotfix

```bash
# Branch from main
git checkout main
git pull origin main
git checkout -b hotfix/critical-issue

# Make fix and commit
git add .
git commit -m "fix(scope): critical issue"

# Create PR to main
# After merge, merge to master too
```

## Best Practices

1. **Keep commits atomic** - One logical change per commit
2. **Write descriptive messages** - Future you will thank you
3. **Push regularly** - Don't accumulate large stacks
4. **Keep branches short-lived** - Merge within 1-2 days
5. **Review your own code first** - Before requesting review
6. **Communicate in PRs** - Explain the "why"
7. **Test before pushing** - Ensure local tests pass
8. **Keep history clean** - Squash/rebase when appropriate

## Troubleshooting

### Accidentally committed to wrong branch?

```bash
# Undo the commit but keep changes
git reset HEAD~1

# Switch to correct branch
git checkout correct-branch

# Commit there
git add .
git commit -m "message"
```

### Need to merge main into feature branch?

```bash
git fetch origin main
git merge origin/main
# Resolve conflicts if any
git push origin feature/branch
```

### Accidentally pushed to wrong branch?

Contact a maintainer - they can help reset the branch if needed.

## Questions?

If you have questions about the workflow:
1. Check [CONTRIBUTING.md](./contribute.md)
2. Open an issue on [GitHub](https://github.com/Ivantech123/Harbor/issues)
3. Ask in [GitHub Discussions](https://github.com/Ivantech123/Harbor/discussions)
