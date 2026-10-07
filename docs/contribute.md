<!--
   - This Source Code Form is subject to the terms of the Mozilla Public
   - License, v. 2.0. If a copy of the MPL was not distributed with this
   - file, You can obtain one at http://mozilla.org/MPL/2.0/.
   -->

# Contributing to Harbor Browser

Thank you for your interest in contributing to Harbor! This guide will help you understand our development process, coding standards, and how to submit your contributions.

## Quick Start

1. **Read Code of Conduct** - [CODE_OF_CONDUCT.md](../CODE_OF_CONDUCT.md)
2. **Check Documentation:**
   - [Git Workflow](./GIT_WORKFLOW.md) - Branching strategy and commit guidelines
   - [Release Process](./RELEASE_PROCESS.md) - How releases are made
   - [Version Strategy](./VERSION_STRATEGY.md) - Versioning scheme
3. **Set up Development Environment** - See setup section below
4. **Create a Branch** - Follow naming conventions from git workflow
5. **Make Changes** - Write code following standards
6. **Test Thoroughly** - Run tests locally
7. **Submit Pull Request** - Use PR template

## Code of Conduct

We are committed to providing a welcoming and inclusive environment for all contributors. Please read and follow our [Code of Conduct](../CODE_OF_CONDUCT.md).

## Types of Contributions

### 🐛 Bug Reports
- Report bugs on [GitHub Issues](https://github.com/Ivantech123/Harbor/issues)
- Use the bug report template
- Include clear reproduction steps
- Specify your OS and Harbor version

### ✨ Feature Requests
- Suggest features on [GitHub Discussions](https://github.com/Ivantech123/Harbor/discussions)
- Use the feature request template
- Explain the use case and benefits
- Consider alternative approaches

### 💻 Code Changes
- Fix bugs or implement features
- Create a feature/bugfix branch
- Follow commit message conventions
- Submit a pull request

### 📖 Documentation
- Improve existing docs
- Add examples and guides
- Fix typos and clarity issues
- Help non-English speakers (translations)

### 🌐 Translations
- Help translate Harbor to more languages
- Check localization in `locales/` directory
- See `scripts/translate_locales.py`

## Local Development Setup

### Prerequisites
- **Node.js** 18+ (check `.nvmrc`)
- **Python** 3.10+ (check `.python-version`)
- **Rust** (check `.rust-toolchain`)
- **Git** 2.0+
- **Platform tools** (Xcode for macOS, Visual Studio for Windows)

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Ivantech123/Harbor.git
   cd Harbor
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Read Firefox build docs:**
   Before building, read [Firefox Build Guide](https://firefox-source-docs.mozilla.org/setup/):
   - Skipping this can lead to build errors
   - Platform-specific setup required
   - Follow official Mozilla guidelines

4. **Set up for development:**
   ```bash
   npm run init
   ```
   This will:
   - Download Firefox source
   - Import necessary files
   - Bootstrap development environment

### Running Development Version

```bash
# Build and run Harbor
npm start

# Or with bloat tracking (advanced)
npm run start:bloat

# Build UI only
npm run build:ui
```

## Development Workflow

### 1. Create Feature Branch

Follow naming conventions from [Git Workflow](./GIT_WORKFLOW.md):

```bash
# Feature
git checkout master
git pull origin master
git checkout -b feature/my-feature-name

# Bug fix
git checkout -b bugfix/issue-description

# Hotfix (from main branch)
git checkout main
git checkout -b hotfix/critical-issue
```

### 2. Make Changes

- One logical change per commit
- Write clear commit messages following [Conventional Commits](./GIT_WORKFLOW.md#commit-message-guidelines)
- Test frequently

```bash
git add .
git commit -m "feat(scope): clear description"
git push -u origin feature/my-feature-name
```

### 3. Testing

```bash
# Run all tests
npm test

# Run specific test
npm test -- tests/specific-test.js

# Run linting
npm run lint

# Fix linting issues
npm run lint:fix

# Type checking
npm run type-check

# Build for all platforms
npm run build
```

### 4. Submit Pull Request

1. **Go to** [GitHub Pull Requests](https://github.com/Ivantech123/Harbor/pulls)
2. **Click** "New Pull Request"
3. **Select** your branch
4. **Fill** PR template
5. **Link** related issues
6. **Submit**

### 5. Review Process

- Minimum 1 reviewer
- Address review comments
- Request re-review after changes
- CI tests must pass
- No conflicts with base branch

## Code Standards

### JavaScript/TypeScript

- Use **ES2020+** features
- Follow **Prettier** formatting (auto-fixed by `npm run lint:fix`)
- Use **ESLint** rules from config
- Add JSDoc comments for public APIs
- Write tests for new features

### Python

- Follow **PEP 8** style guide
- Use type hints where applicable
- Write docstrings for functions
- Test scripts before committing

### CSS/Styling

- Use CSS variables where possible
- Follow existing naming conventions
- Support both light and dark modes
- Test on multiple screen sizes

### Commit Messages

Follow [Conventional Commits](./GIT_WORKFLOW.md#commit-message-guidelines):

```
type(scope): subject

Detailed explanation if needed.

Closes #123
```

**Types:** feat, fix, perf, refactor, test, docs, style, chore, ci, revert

## Branch Structure

Our branching model uses Git Flow:

- **`main`** - Production releases (protected)
- **`master`** - Development integration (protected)
- **`release/*`** - Release branches (protected)
- **`twilight`** - Testing channel
- **`feature/*`** - Feature branches (your PRs)
- **`bugfix/*`** - Bug fix branches
- **`hotfix/*`** - Critical fixes from main

See [Git Workflow](./GIT_WORKFLOW.md) for details.

## Release Information

- **Release Cadence:** Monthly (approximately)
- **Versioning:** [Semantic Versioning](./VERSION_STRATEGY.md)
- **Current Version:** Check [CHANGELOG.md](../CHANGELOG.md)
- **Process:** See [Release Process](./RELEASE_PROCESS.md)

## Project Structure

```
├── src/harbor/          # Harbor-specific components
│   ├── spaces/          # Spaces feature
│   ├── tabs/            # Tab management
│   ├── split-view/      # Split view feature
│   ├── live-folders/    # Live folders
│   ├── mods/            # Theme customization
│   └── ...
├── src/browser/         # Firefox browser patches
├── prefs/               # Preference/settings files
├── locales/             # Translations (30+ languages)
├── scripts/             # Build and utility scripts
├── build/               # Build configuration
├── tests/               # Test suites
└── docs/                # Documentation
```

## Common Tasks

### Adding a Feature

1. Create feature branch: `feature/my-feature`
2. Make changes following code standards
3. Add tests
4. Update documentation
5. Commit with conventional message
6. Push and create PR

### Fixing a Bug

1. Create bugfix branch: `bugfix/issue-description`
2. Add test reproducing the bug
3. Fix the bug
4. Verify test now passes
5. Commit with `fix(scope): description`
6. Push and create PR

### Updating Translations

1. Update translation files in `locales/`
2. Run: `npm run translate`
3. Test in your language
4. Commit changes
5. Create PR

### Adding Tests

```javascript
// tests/feature/my-feature.js
add_task(async function test_my_feature() {
  // Test code
  Assert.ok(condition, "Description");
});
```

Run tests: `npm test`

## Documentation

- **README.md** - Overview and quick start
- **CHANGELOG.md** - Version history
- **docs/GIT_WORKFLOW.md** - Git conventions
- **docs/RELEASE_PROCESS.md** - How releases work
- **docs/VERSION_STRATEGY.md** - Versioning scheme
- **Contributing code?** Update relevant docs

## Getting Help

- **Issues:** [GitHub Issues](https://github.com/Ivantech123/Harbor/issues)
- **Discussions:** [GitHub Discussions](https://github.com/Ivantech123/Harbor/discussions)
- **Documentation:** Check `docs/` folder
- **Firefox Docs:** [firefox-source-docs.mozilla.org](https://firefox-source-docs.mozilla.org/)

## Recognition

Contributors are recognized in:
- GitHub contributors page
- Release notes
- Project documentation

## Legal

- Code contributions are under [MPL-2.0](../LICENSE)
- Copyright retained by contributors
- Contributions imply agreement to license

## Questions?

Don't hesitate to ask:
1. Check existing documentation
2. Search closed issues
3. Open a discussion
4. Ask in relevant issue

Thank you for contributing to Harbor! 🚀
