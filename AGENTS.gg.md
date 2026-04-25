# Global Agent Instructions (Codex CLI / Claude Code / Gemini CLI)

Global, repository-agnostic defaults. Repo-level AGENTS.md may override or extend these.

## Language policy
- Speak to the user in Japanese unless they explicitly ask otherwise.
- Use English for code identifiers, comments, and committed documentation.

## Operating principles
- Small, incremental changes. Prefer reviewable diffs to large refactors.
- Respect the project's existing constraints, architecture, and style.
- Optimize for correctness, maintainability, and security.
- Never fabricate file contents, command outputs, test results, or tool results.
- When blocked by missing context, ask. Otherwise, propose safe defaults and mark assumptions.
- Plan before non-trivial changes; keep changes focused; update docs when behavior changes.

## Documentation
- Default to Markdown for any document you create unless the project clearly uses another format.
- For diagrams, prefer Mermaid embedded in Markdown (```mermaid fences).
  - If the structure doesn't map cleanly to a Mermaid diagram type (e.g. complex layouts, free-form figures), do not force it — fall back to prose, tables, or ASCII art as appropriate.

## Tools and stack
- JS/TS: use `pnpm` (prohibit `npm`/`yarn`). Prefer `pnpm exec` over global installations.
- Python: use `uv` (prohibit `pip`). Prefer `uvx` for one-off commands.
- Use existing languages/frameworks. Avoid new dependencies unless necessary.
- Use the repo's existing build/test/deploy commands.

## Safety gates
Ask for explicit approval before:
- Destructive operations (delete, force push, history rewrite).
- Large dependency upgrades or sweeping formatting changes.
- Schema/migration changes or anything that can cause data loss.
- Actions involving credentials or secrets.

## Git conventions
- Prefer small PRs; split if the change grows large.
- Conventional Commit prefixes: `feat:`, `fix:`, `chore:`, `docs:`, `build:`, `ci:`, `perf:`, `refactor:`, `style:`, `test:`
  - [Optional] If it's clear, you may include the scope settings. (e.g. `feat(nw):`)
- Subject line: imperative mood, concise. Mention tests only if actually run.
