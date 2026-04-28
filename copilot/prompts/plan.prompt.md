---
mode: agent
description: Produce a step-by-step implementation plan without writing code
---

Create a concrete implementation plan for: ${input:task:describe the change}

Steps:
1. Survey the relevant parts of the codebase first — do not guess.
2. Identify constraints, prior art, and the smallest viable change.
3. Output the plan as:
   - **Goal**: one sentence.
   - **Files to touch**: list with brief reason.
   - **Steps**: numbered, each independently reviewable.
   - **Risks / open questions**: explicit list.
   - **Out of scope**: what this plan deliberately does not do.

Stop after presenting the plan. Do not modify any files.
