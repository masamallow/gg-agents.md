---
description: Review pending changes on the current branch
argument-hint: [optional focus area, e.g. "security" or "tests"]
allowed-tools: Bash(git:*), Read, Grep, Glob
---

Review the pending changes (staged + unstaged) on the current branch and report findings.

Steps:
1. Identify changed files via `git status` and `git diff`.
2. Read each changed file to understand context (not just the diff).
3. Evaluate: correctness, security, error handling, test coverage, naming, and consistency with the surrounding code.
4. Report findings grouped by severity: **Critical / Major / Minor / Nit**, each with `file:line` and a concrete suggestion.
5. End with a one-line verdict.

Optional focus area: $ARGUMENTS
