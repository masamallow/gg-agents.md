# Global Agent Instructions (Codex / Claude Code / Gemini CLI)

## 0. Scope
- These instructions are global and repository-agnostic.
- If repository-specific rules are required, ask for them (do not guess).

## 1. Operating principles
- Prefer correctness and maintainability over speed.
- Keep changes minimal and reviewable; avoid opportunistic refactors.
- Never fabricate: file contents, command outputs, test results, benchmarks, API responses.
- When uncertain, present 2–3 options with trade-offs and a recommendation.

## 2. Default delivery workflow (Plan → Documentation → Implement → Review)
1) Plan
- Restate the goal and constraints.
- Identify likely affected files/components (best effort).
- Provide a numbered plan with checkpoints.
- Define acceptance criteria (Definition of Done) and a test strategy.
- List risks and unknowns; ask targeted questions if blocking.

2) Documentation
- If behavior, interfaces, or usage changes: update docs first (or in the same change).
- Prefer short, actionable docs: examples, expected outputs, and common failure modes.

3) Implement
- Implement step-by-step following the plan checkpoints.
- Keep diffs small; split into cohesive commits if applicable.
- Prefer tests over manual verification when feasible.

4) Review (self-review before handoff)
- Re-check scope creep, correctness, test coverage, and security.
- Summarize what changed, why, and what to test.

## 3. “Approval” policy (commands / file writes)
- Ask for explicit approval before:
  - destructive commands (delete/reset/force-push)
  - dependency upgrades with broad impact
  - migrations / schema changes
  - actions that can leak secrets or touch credentials
- If the tool supports an approvals mode, default to “ask before write/run”.

## 4. git worktree conventions (parallel work)
- Assume parallel development using git worktree.
- One worktree == one branch == one task/PR.
- Do not have multiple agents edit the same worktree concurrently.
- Treat these as shared-assets (extra caution / serialize changes):
  - lock files, migrations, generated code, CI configs, API schemas

## 5. MCP usage policy (Model Context Protocol)
- Prefer read-only tools.
- For any tool that can write/delete/mutate: require explicit approval.
- If MCP tools are used for key decisions, briefly record:
  - which tools were used
  - what data was fetched
  - how it influenced the plan

## 6. Output format requirements
- Plan: numbered steps + checkpoints + acceptance criteria + risks.
- Implementation: short changelog + commands actually run (only if run).
- Review: findings grouped by severity (blocker/major/minor/nit) + minimal fixes.

## 7. Definition of Done (DoD)
A change is “done” when:
- Acceptance criteria are met.
- Tests are added/updated and pass (or explicitly justified).
- Documentation is updated if behavior/usage changed.
- No secrets/sensitive data are introduced.
