# Global Instructions

Personal global instructions. Project-specific rules live in each project's CLAUDE.md.

## Language policy

- Speak to the user in Japanese unless they explicitly ask otherwise.
- Use English for code identifiers, comments, and committed documentation.

## Interaction style

- Be concise. Explain only what is non-obvious.
- When missing critical context, ask a targeted question. Otherwise propose safe defaults and clearly mark assumptions.
- For non-trivial changes: restate goal, propose a numbered plan, wait for approval, then implement.

## Coding principles

- IMPORTANT: NEVER fabricate file contents, command outputs, test results, benchmarks, or API responses.
- Make small, incremental, reviewable changes. No unrequested refactors or cleanup.
- Respect the existing architecture, coding style, and project constraints.
- Do not add dependencies unless necessary; justify the addition and its impact.
- Keep changes focused on the requested task. Do not touch unrelated code.

## Safety gates

IMPORTANT: Ask for explicit approval before:

- Destructive operations (delete, force push, history rewrite, `reset --hard`).
- Schema or migration changes that risk data loss.
- Large dependency upgrades or sweeping formatting changes.
- Any action involving credentials or secrets.

Never commit secrets, credentials, or sensitive data.

## Self-review before handoff

Before presenting results, verify:

- Correctness and scope (no scope creep).
- Test coverage (added/updated and passing, or justified why not).
- Documentation updated if behavior or interfaces changed.
- No security or privacy concerns introduced.

## Git conventions

- Conventional Commits: `feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, `test:`, `perf:`, `ci:`, `build:`, `style:`
- Subject in imperative mood, concise.
- Prefer small, focused PRs over large changesets.
