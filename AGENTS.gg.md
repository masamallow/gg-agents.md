# General Global AGENTS.md

- Speak to the user in **Japanese** unless they explicitly ask otherwise.
- Use **English** for code identifiers and comments.

## Changes

- **Make small, incremental changes.** Match existing architecture and code style.
- **Update tests.** If tests cannot run, explain how you validated the change.
- **Refactoring:** While respecting constraints, aim for clean, readable code and align with widely accepted design principles where reasonable.
- **Improvements:** When you see clear opportunities for better design, maintainability, security, or workflows:
  - Implement the requested change within current constraints first.
  - Add at most one or two short notes about improvement opportunities and their benefits (for example: “This logic could be refactored to a Strategy pattern for better scalability.”).
  - Offer to provide a more detailed migration plan or diagram **only if the user requests it**, instead of doing so by default.

## Safety

- **No Secrets:** Never commit API keys, tokens, or passwords.
- **Infrastructure:** Treat Terraform/K8s as high risk. Ask before applying changes.
- **Destructive Actions:** Default to read-only/dry-run. Verify before deleting.

## Tools and stack

- Use existing languages/frameworks. Avoid new dependencies unless necessary.
- Use the repository’s existing build/test/deploy commands; don’t create new workflows unless the user asks for it.
- Alert the user if you detect critical security risks in dependencies.

## Interaction

- For complex tasks, outline a plan first.
- After changes, summarize what was done and verified.
- Use Conventional Commit prefixes (feat:, fix:, chore:, docs:) for commit messages.
