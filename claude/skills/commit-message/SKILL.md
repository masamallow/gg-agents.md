---
name: commit-message
description: Use when drafting a git commit message. Enforces Conventional Commits, imperative subject ≤72 chars, and a body that explains the why rather than the what.
---

# Commit message style

Format: `<type>(<scope>): <subject>`

- **type**: one of `feat`, `fix`, `chore`, `docs`, `build`, `ci`, `perf`, `refactor`, `style`, `test`
- **scope** (optional): short noun describing the area touched
- **subject**: imperative mood, no trailing period, ≤72 chars

Body (optional, separated by a blank line):
- Wrap at ~72 chars.
- Explain *why* the change is needed and *why this approach*. Skip the *what* — the diff already shows it.
- Reference issues with `Refs #123` / `Fixes #123` only when applicable.

Avoid:
- Mentioning tests unless they were actually run in this change.
- Co-author trailers unless explicitly requested.
- Marketing language ("massive improvement", "huge refactor").

Example:
```
fix(auth): reject tokens issued before key rotation

Tokens minted with the previous signing key were still accepted because
the verifier kept both keys in its trust set indefinitely. Drop the old
key once the rotation grace period expires.
```
