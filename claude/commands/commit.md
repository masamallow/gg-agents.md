---
description: Stage relevant changes and create a Conventional Commit
argument-hint: [optional scope or message hint]
allowed-tools: Bash(git:*)
---

Create a focused commit for the current working tree.

Steps:
1. Run `git status` and `git diff` (staged + unstaged) to understand what changed.
2. Run `git log -n 10 --oneline` to match the repo's commit style.
3. Stage only files relevant to the logical change (avoid `git add -A`/`.`).
4. Write a Conventional Commit message: `<type>(<scope>): <imperative subject>`.
   - Types: feat, fix, chore, docs, build, ci, perf, refactor, style, test
   - Subject ≤ 72 chars, imperative mood, no trailing period.
   - Body (optional): explain the *why*, not the *what*.
5. Do NOT mention tests unless they were actually run.
6. Do NOT include co-author trailers unless the user asks.

Hint from the user (optional): $ARGUMENTS
