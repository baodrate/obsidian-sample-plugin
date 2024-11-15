# Obsidian Plugin Template

Obsidian plugin [copier](https://github.com/copier-org/copier) template.

## Foundation

Based on [obsidian-sample-plugin](https://github.com/obsidianmd/obsidian-sample-plugin) project, with additional features and fixes:

### New features

- use [biome](https://biomejs.dev) for linting and formatting
- configure [sourceRoot](https://esbuild.github.io/api/#source-root) so source maps will be separated for each plugin
- add [obsidian-typings](https://github.com/Fevol/obsidian-typings)
- use [i18next](https://www.i18next.com/) for internationalization (and use obsidian's [built-in library](https://forum.obsidian.md/t/expose-useful-libraries-to-plugin-devs-incl-i18next/89371) to keep the bundled size small)
- add [release-please](https://github.com/googleapis/release-please-action)-based github workflow to automatically bump version numbers and generate changelogs

### Fixes

- use unix line-endings in all project files
- target ES2022 when building (and use newer JS syntax where available)
- use `src/` directory and split into multiple files
- track obsidian type definitions package version
