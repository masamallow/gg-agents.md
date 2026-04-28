# GitHub Copilot

Unlike Codex / Claude Code / Gemini CLI, Copilot has no single user-home config directory. Personalization is mediated by the IDE (VS Code, JetBrains, …) and partially by github.com. Resources in this repo target the locations each client actually reads.

## Resource layout in this repo

```
copilot/
├── global-copilot-instructions.md       # JetBrains user-level (symlink target)
├── instructions/                        # VS Code user-level instructions
│   ├── code-style.instructions.md
│   └── tests.instructions.md
├── prompts/                             # VS Code user-level prompt files
│   ├── review.prompt.md
│   └── plan.prompt.md
├── chatmodes/                           # VS Code user-level custom chat modes
│   └── explorer.chatmode.md
└── copilot-instructions.md              # Project template (.github/copilot-instructions.md)
```

## Support matrix (canonical, per GitHub docs)

| Instruction type                     | VS Code | JetBrains | Visual Studio | Xcode | Eclipse | CLI | github.com | Coding Agent |
| ------------------------------------ | :-----: | :-------: | :-----------: | :---: | :-----: | :-: | :--------: | :----------: |
| `AGENTS.md`                          | ✓       | ✓         | ✗             | ✓     | ✓       | ✓   | ✓          | ✓            |
| `.github/copilot-instructions.md`    | ✓       | ✓         | ✓             | ✓     | ✓       | ✓   | ✓          | ✓            |
| Path-scoped `*.instructions.md`      | ✓       | ✓         | ✓             | ✓     | ✗       | ✓   | ✓          | ✓            |
| Personal Instructions (web only)     | ✗       | ✗         | ✗             | ✗     | ✗       | ✗   | ✓          | ✗            |

Source: <https://docs.github.com/en/copilot/reference/custom-instructions-support>

## Per-client setup

### JetBrains IDEs (IntelliJ IDEA, PyCharm, GoLand, …)

JetBrains stores user-level Copilot instructions in a single Markdown file:

| OS              | Path                                                                                  |
| --------------- | ------------------------------------------------------------------------------------- |
| macOS / Linux   | `~/.config/github-copilot/intellij/global-copilot-instructions.md`                    |
| Windows         | `%LOCALAPPDATA%\github-copilot\intellij\global-copilot-instructions.md`               |

Symlink it to this repo's file:

```bash
mkdir -p ~/.config/github-copilot/intellij
ln -s "$PWD/copilot/global-copilot-instructions.md" \
      ~/.config/github-copilot/intellij/global-copilot-instructions.md
```

`AGENTS.md` is also picked up at the repository root in JetBrains.

### VS Code

VS Code reads user-level instruction / prompt / chat-mode files from any directory listed in the corresponding setting. Add this repo's directories to your **user** `settings.json` (`~/.config/Code/User/settings.json` on Linux, `~/Library/Application Support/Code/User/settings.json` on macOS, `%APPDATA%\Code\User\settings.json` on Windows):

```json
{
  "chat.useAgentsMdFile": true,
  "chat.instructionsFilesLocations": {
    "/absolute/path/to/gg-agents.md/copilot/instructions": true
  },
  "chat.promptFilesLocations": {
    "/absolute/path/to/gg-agents.md/copilot/prompts": true
  },
  "chat.agentFilesLocations": {
    "/absolute/path/to/gg-agents.md/copilot/chatmodes": true
  }
}
```

Replace `/absolute/path/to/gg-agents.md` with the actual checkout path.

### github.com (Personal Instructions)

Web-only text field. Open <https://github.com/settings/copilot> → *Personal instructions*. Paste content from `global-copilot-instructions.md` (or a trimmed subset). No file or symlink possible.

### Visual Studio / Xcode / Eclipse / Copilot CLI

These clients support repo-level files (`.github/copilot-instructions.md`, `AGENTS.md`, path-scoped `*.instructions.md` where supported per the matrix above) but do **not** expose user-level instruction file paths in their official documentation. Use the project template (`copilot/copilot-instructions.md`) and `AGENTS.gg.md` at the repository root.

## File frontmatter cheatsheet

**Path-scoped instructions** (`*.instructions.md`):

```yaml
---
applyTo: "**/*.ts,**/*.tsx"
---
```

**Prompt file** (`*.prompt.md`):

```yaml
---
mode: agent          # or `ask` | `edit`
description: Short description shown in the picker
---
```

Use `${input:name:placeholder}` to declare a slot the user fills at invocation.

**Custom chat mode** (`*.chatmode.md`):

```yaml
---
description: Short description
tools: ['codebase', 'search']
---
```

## References

- Custom instructions overview: <https://docs.github.com/en/copilot/concepts/response-customization>
- Repository instructions: <https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions>
- Personal instructions (github.com): <https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-personal-instructions>
- Support matrix: <https://docs.github.com/en/copilot/reference/custom-instructions-support>
- VS Code custom instructions: <https://code.visualstudio.com/docs/copilot/customization/custom-instructions>
- VS Code prompt files: <https://code.visualstudio.com/docs/copilot/customization/prompt-files>
- VS Code custom chat modes: <https://code.visualstudio.com/docs/copilot/customization/custom-chat-modes>
- JetBrains global instructions (Microsoft devblog): <https://devblogs.microsoft.com/java/customize-github-copilot-in-jetbrains-with-custom-instructions/>
