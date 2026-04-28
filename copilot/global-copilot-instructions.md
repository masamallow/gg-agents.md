# Global GitHub Copilot Instructions (JetBrains)

Personal defaults for GitHub Copilot in JetBrains IDEs.
Project-level `.github/copilot-instructions.md` and `AGENTS.md` may override or extend these.

Symlink target:

- macOS / Linux: `~/.config/github-copilot/intellij/global-copilot-instructions.md`
- Windows: `%LOCALAPPDATA%\github-copilot\intellij\global-copilot-instructions.md`

## Operating principles

- Small, incremental changes. Prefer reviewable diffs to large refactors.
- Respect the project's existing constraints, architecture, and style.
- Optimize for correctness, maintainability, and security.
- Never fabricate file contents, command outputs, or test results.
- Plan before non-trivial changes; keep changes focused; update docs when behavior changes.

## Style

- Use English for code identifiers, comments, and committed documentation.
- Default to Markdown for any document; prefer Mermaid for diagrams.

## Tools and stack

- JS/TS: use `pnpm` (avoid `npm` / `yarn`).
- Python: use `uv` (avoid bare `pip`).
- Reuse existing languages/frameworks; avoid new dependencies unless necessary.

## Git conventions

- Conventional Commit prefixes: `feat`, `fix`, `chore`, `docs`, `build`, `ci`, `perf`, `refactor`, `style`, `test`.
- Subject line: imperative mood, ≤72 chars, no trailing period.
- Body: explain *why*, not *what*.
- Mention tests only if actually run.
