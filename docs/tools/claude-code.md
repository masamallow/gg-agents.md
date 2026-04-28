# Claude Code

Anthropic's terminal coding agent. Resources in this repo target `~/.claude/`.

## Layout in `~/.claude/`

| Path                          | Purpose                                                 | Symlinked from              |
| ----------------------------- | ------------------------------------------------------- | --------------------------- |
| `CLAUDE.md`                   | Global memory / instructions                            | `CLAUDE.gg.md`              |
| `settings.json`               | User-level settings — see template below (not symlinked) | —                          |
| `agents/<name>.md`            | Custom subagents (YAML frontmatter + system prompt)     | `claude/agents/`            |
| `commands/<name>.md`          | Custom slash commands                                   | `claude/commands/`          |
| `skills/<name>/SKILL.md`      | Skills (auto-invoked by description match)              | `claude/skills/`            |
| `output-styles/<name>.md`     | Output styles (`/output-style <name>`)                  | `claude/output-styles/`     |
| `hooks/`                      | Hook scripts referenced from `settings.json`            | `claude/hooks/`             |
| `.credentials.json`, `*.log`  | Auto-generated — do not track                           | —                           |

## `settings.json` template

Claude Code itself writes to `~/.claude/settings.json` (e.g. `/permissions`, `/model`, `/output-style`). Symlinking it would cause edits on either side to be lost on atomic rewrite, so this repo keeps it as a copy-paste template instead.

```json
{
  "$schema": "https://json.schemastore.org/claude-code-settings.json",
  "includeCoAuthoredBy": true,
  "cleanupPeriodDays": 30,
  "env": {},
  "permissions": {
    "defaultMode": "default",
    "allow": [],
    "ask": [],
    "deny": [
      "Bash(rm -rf /:*)",
      "Bash(sudo:*)",
      "Read(./.env)",
      "Read(./.env.*)",
      "Read(./secrets/**)",
      "Read(./**/id_rsa)",
      "Read(./**/id_ed25519)"
    ],
    "additionalDirectories": []
  },
  "hooks": {}
}
```

## Settings precedence (high → low)

1. Enterprise managed policy
2. CLI flags
3. Project local `.claude/settings.local.json`
4. Project shared `.claude/settings.json`
5. User `~/.claude/settings.json`

## Resource frontmatter cheatsheet

**Subagent** (`agents/<name>.md`):
```yaml
---
name: my-agent
description: When to use it (proactively-worded helps auto-delegation)
tools: Read, Grep, Bash      # optional; omit to inherit all
model: inherit               # or sonnet | opus | haiku
---
System prompt body…
```

**Slash command** (`commands/<name>.md`):
```yaml
---
description: Short description shown in /help
argument-hint: <args>
allowed-tools: Bash(git:*), Read
model: sonnet                # optional
---
Prompt body. Use $ARGUMENTS for the user input.
```

**Skill** (`skills/<name>/SKILL.md`):
```yaml
---
name: skill-name
description: When to use this skill (the matcher reads this)
---
Instructions…
```

**Output style** (`output-styles/<name>.md`):
```yaml
---
name: concise
description: Short summary
---
Tone / format rules…
```

## Hooks

Configured in `settings.json` under `hooks.<event>`. Events: `PreToolUse`, `PostToolUse`, `UserPromptSubmit`, `Stop`, `SubagentStop`, `Notification`, `SessionStart`, `SessionEnd`, `PreCompact`. Each entry has a `matcher` (tool name regex) and a list of `hooks` with `type: "command"` and a shell `command`. Exit code `2` from a `PreToolUse` hook blocks the tool call.

## References

- Docs hub: <https://docs.claude.com/en/docs/claude-code/overview>
- Settings: <https://docs.claude.com/en/docs/claude-code/settings>
- Subagents: <https://docs.claude.com/en/docs/claude-code/sub-agents>
- Slash commands: <https://docs.claude.com/en/docs/claude-code/slash-commands>
- Skills: <https://docs.claude.com/en/docs/claude-code/skills>
- Hooks: <https://docs.claude.com/en/docs/claude-code/hooks>
- Memory (CLAUDE.md): <https://docs.claude.com/en/docs/claude-code/memory>
