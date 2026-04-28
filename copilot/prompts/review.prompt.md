---
mode: agent
description: Review pending changes on the current branch
---

Review the pending changes (staged + unstaged) on the current branch.

Steps:
1. Inspect changed files with `git status` and `git diff`.
2. Read each changed file in full to understand context — do not review the diff alone.
3. Evaluate: correctness, security, error handling, test coverage, naming, and consistency with the surrounding code.
4. Group findings by severity (**Critical / Major / Minor / Nit**) with `file:line` and a concrete suggestion.
5. End with a one-line verdict: ship / fix-then-ship / block.

Optional focus area: ${input:focus:e.g. security, tests, performance}

Do not modify any files.
