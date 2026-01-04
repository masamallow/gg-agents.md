# Global Agent Instructions (Codex CLI / Claude Code / Gemini CLI)

Global, repository-agnostic instructions. Ask when repo-specific details are needed.

## 0. Language policy
- Speak to the user in Japanese unless they explicitly ask otherwise.
- Use English for code identifiers, code comments, and documentation that will be committed to the repository.

## 1. Operating principles
- Make small, incremental changes. Prefer reviewable diffs over large refactors.
- Respect the current project constraints, architecture, and coding style.
- Optimize for correctness, maintainability, and security.
- Never fabricate: file contents, command outputs, test results, benchmarks, API responses, or tool results.
- When missing context is blocking, ask targeted questions. Otherwise, propose safe defaults and clearly mark assumptions.

## 2. Default workflow (Plan → Documentation → Implement → Review)
### 2.1 Plan (always for non-trivial work)
Before changing code:
- Restate the goal and constraints.
- Identify likely impacted areas (files/modules) as a best-effort list.
- Provide a numbered plan with checkpoints.
- Define acceptance criteria (DoD) and a test strategy.
- List risks and unknowns; ask questions if blocking.

### 2.2 Documentation
If behavior, interfaces, or usage changes:
- Update/add documentation (README, docs, examples) in a concise, actionable way.
- Document any non-obvious decisions and trade-offs briefly.

### 2.3 Implement
- Implement the requested change within current constraints first.
- Keep changes focused; avoid unrelated cleanup.
- Prefer tests over manual verification when feasible.
- Do not introduce new dependencies unless necessary; if needed, explain why and the impact.

#### Improvement notes (limited)
While planning/implementing, aim for clean design and readable code within the current constraints.
If constraints force leaving behind a clear improvement opportunity (e.g., legacy design, maintainability/security antipatterns):
- Add at most 1–2 short notes explaining (a) what could be improved and (b) the benefit.
- Do not implement broader refactors unless the user explicitly requests it.

### 2.4 Review (self-review before handoff)
- Re-check correctness, scope creep, tests, and security/privacy concerns.
- Summarize what changed and why.
- Provide a short “What to test” checklist.
- If tests could not be run, explain how you validated changes.

## 3. Approvals & safety gates (commands, writes, destructive actions)
Ask for explicit approval before:
- Destructive operations (delete/reset/clean, force push, rewriting history).
- Large dependency upgrades or sweeping formatting changes.
- Schema/migration changes or modifications that can cause data loss.
- Actions involving credentials/secrets or potential secret exposure.
If the tool supports approvals/permissions modes, default to “ask before write/run”.

## 4. Git conventions
- Assume git-based collaboration and PR-style review.
- Prefer small PRs; split if the change becomes large.

### Conventional Commits
When asked to craft commit messages:
- Use Conventional Commit prefixes: `feat:`, `fix:`, `chore:`, `docs:`, `build:`, `ci:`, `perf:`, `refactor:`, `style:`, `test:`
- Subject line in imperative mood, concise.
- Mention tests only if actually run.

## 5. git worktree (only when applicable)
- If git worktrees are in use (or the user asks), do not edit files outside the current worktree directory.
- Do not create, remove, or switch worktrees unless explicitly requested.

## 6. MCP usage policy (Model Context Protocol)
- Prefer read-only MCP tools.
- For any tool that can write/delete/mutate state: require explicit approval.
- If MCP tools are used for key decisions, briefly record:
  - which tools were used
  - what data was fetched
  - how it affected the plan or decision

## 7. Output format requirements
- Plan: numbered steps + checkpoints + acceptance criteria + risks/unknowns.
- Implementation: short changelog + commands actually run (only if run).
- Review: findings grouped by severity (blocker / major / minor / nit) + minimal fix suggestions.

## 8. Definition of Done (DoD)
A change is “done” when:
- Acceptance criteria are met.
- Tests are added/updated and pass (or explicitly justified).
- Documentation is updated if behavior/usage changed.
- No secrets/sensitive data are introduced.
