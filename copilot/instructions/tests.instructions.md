---
applyTo: "**/*.test.*,**/*.spec.*,**/tests/**,**/__tests__/**"
---

# Test code style

- One behavior per test; descriptive names that read as a sentence.
- Arrange / Act / Assert layout, with blank lines separating sections.
- Prefer real values over mocks; mock only at trust boundaries (network, fs, time).
- Avoid snapshot tests for logic — use them only for stable, large output shapes.
- Each test must be independent: no shared mutable state, no order dependency.
