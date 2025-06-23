# Obsidian Plugin Template

Obsidian plugin [copier](https://github.com/copier-org/copier) template.

## Usage

```sh
docker run -ti --rm -v <OUTPUT_DIR>:/app <DOCKER_IMAGE>
```

## Foundation

Based on [obsidian-sample-plugin](https://github.com/obsidianmd/obsidian-sample-plugin) project, with additional features and fixes:

### New features and code quality updates

- configure [sourceRoot](https://esbuild.github.io/api/#source-root) so source maps will not overlap with other plugins
- add [obsidian-typings](https://github.com/Fevol/obsidian-typings)
  - for type-hints for Obsidian's undocumented APIs
- use [i18next](https://www.i18next.com/) for internationalization
  - use obsidian's [built-in library](https://forum.obsidian.md/t/expose-useful-libraries-to-plugin-devs-incl-i18next/89371) to keep the bundled size small
- define global `__DEV__` constant/label for tree-shaking
  - global variable `__DEV__` is replaced with literal `true`/`false` in development/production builds, respectively
    - i.e. code wrapped in `if (__DEV__) { ... }` will be dropped in non-development builds
  - `__DEV__:`-labelled statements will be dropped from production builds completely

### Fixes

- use unix line-endings in all project files
- target ES2022 when building (and use newer JS syntax where available)
- use `src/` directory and split into multiple files
- track obsidian type definitions package version
- bump minAppVersion to `1.8.0`

### Build & Release

- use pnpm as package manager instead of npm
- use [biome](https://biomejs.dev) for linting and formatting, instead of eslint
- add [release-please](https://github.com/googleapis/release-please-action)-based github workflow to automatically bump version numbers and generate changelogs
  - github (pre-)releases are compatible with [BRAT](https://github.com/TfTHacker/obsidian42-brat)
- replace esbuild with [vite](https://vite.dev/)
- use [husky](https://github.com/typicode/husky) for pre-commit hooks
  - use [commitlint](https://commitlint.js.org/) to validate commit messages match the [Conventional Commits](https://www.conventionalcommits.org) specification

### Meta

- default [funding url](https://docs.obsidian.md/Reference/Manifest#fundingUrl) to [GitHub Sponsors](https://github.com/sponsors)
- (configurable) add a license to the project

### Todo

- [ ] only cut a release-please PR if the build artifacts change
