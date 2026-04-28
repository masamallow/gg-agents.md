# Repository Copilot Instructions (template)

Drop this file into a project as `.github/copilot-instructions.md`.
Repository-wide guidance picked up by GitHub Copilot in all clients (VS Code, JetBrains, Visual Studio, Xcode, Eclipse, CLI, github.com, Coding Agent).

## Project conventions

- Match the surrounding code's conventions before introducing new ones.
- Prefer small, reviewable diffs over sweeping refactors.

## Tooling

- JS/TS: use `pnpm` (avoid `npm` / `yarn`).
- Python: use `uv` (avoid bare `pip`).
- Reuse existing build/test/deploy commands rather than introducing new ones.

## Tests

- Run the project's test command before declaring a change complete.
- Mention tests in commit messages only if they were actually run.

## Git

- Conventional Commit prefixes: `feat`, `fix`, `chore`, `docs`, `build`, `ci`, `perf`, `refactor`, `style`, `test`.
- Subject line: imperative mood, ≤72 chars, no trailing period.
- Body explains *why*, not *what*.
