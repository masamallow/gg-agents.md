---
applyTo: "**"
---

# General code style

- Match the surrounding code's conventions before introducing new ones.
- Names: descriptive over short; avoid one-letter identifiers outside tight scopes.
- Comments: write *why*, not *what*. The diff already shows the *what*.
- No dead code, commented-out blocks, or `TODO` without an owner/issue.
- Keep functions small; extract when a helper would be reused at least twice.
- Validate at trust boundaries (user input, external APIs); skip defensive checks against trusted internal callers.
