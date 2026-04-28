# Gemini CLI

Google's terminal coding agent. Resources in this repo target `~/.gemini/`.

## Layout in `~/.gemini/`

| Path                        | Purpose                                          | Symlinked from              |
| --------------------------- | ------------------------------------------------ | --------------------------- |
| `GEMINI.md`                 | Global memory / instructions                     | `gemini/GEMINI.gg.md`       |
| `settings.json`             | User-level settings — see template below (not symlinked) | —                   |
| `commands/<name>.toml`      | Custom slash commands (TOML, not Markdown)       | `gemini/commands/`          |
| `extensions/<name>/`        | Extensions (custom tools / context)              | —                           |
| `tmp/`, logs                | Auto-generated — do not track                    | —                           |

## `settings.json` template

Gemini CLI persists user choices (theme, auth, etc.) into `~/.gemini/settings.json`. Symlinking would conflict with these writes, so this repo keeps it as a copy-paste template instead.

```json
{
  "contextFileName": "GEMINI.md",
  "vimMode": false,
  "autoAccept": false,
  "checkpointing": {
    "enabled": true
  },
  "fileFiltering": {
    "respectGitIgnore": true
  },
  "telemetry": {
    "enabled": false
  },
  "mcpServers": {}
}
```

## Settings precedence (high → low)

1. CLI flags
2. Project `.gemini/settings.json`
3. User `~/.gemini/settings.json`
4. System `/etc/gemini-cli/settings.json` (if present)

## Custom command frontmatter (TOML)

```toml
description = "Short description shown in /help"
prompt = """
Prompt body. Use {{args}} for the user input.
"""
```

Place at `~/.gemini/commands/<name>.toml`. Subdirectories namespace the command (e.g. `git/commit.toml` → `/git:commit`).

## References

- Repo: <https://github.com/google-gemini/gemini-cli>
- Configuration: <https://github.com/google-gemini/gemini-cli/blob/main/docs/cli/configuration.md>
- Commands: <https://github.com/google-gemini/gemini-cli/blob/main/docs/cli/commands.md>
- Memory (GEMINI.md): <https://github.com/google-gemini/gemini-cli/blob/main/docs/cli/memory.md>
