# GG AGENTS.md

Personal **G**eneral **G**lobal **AGENTS.md** ― A universal agent instruction file for AI coding agents.

## Overview

This repository provides [AGENTS.gg.md](AGENTS.gg.md), my personal agent instruction file that offers consistent guidelines and preferences for AI coding agents (like Codex, Claude Code, Cursor, Windsurf, etc.) across all my projects and tools.

By maintaining a single, centralized instruction file, I ensure that AI assistants understand my development workflow, coding standards, and safety practices regardless of which project I'm working on.

## Features

🚧 _Documentation in progress_

## What's Included

📝 _Coming soon_

## Usage

### Quick Setup

1. Clone this repository, then `cd /path/to/gg-agents.md`

2. Run the setup script:
```bash
./scripts/setup.sh
```

The script will:
- Create symlinks from each AI agent's global instruction file to `AGENTS.gg.md`
- Backup any existing instruction files to `bak/<service>/` before overwriting

### Supported Services

| Service | Global Instruction Path | Symlink Target |
|---------|-------------------------|----------------|
| [Codex](https://developers.openai.com/codex/guides/agents-md) | `~/.codex/AGENTS.md`    | `AGENTS.gg.md` |
| [Claude Code](https://www.claude.com/blog/using-claude-md-files) | `~/.claude/CLAUDE.md`   | `AGENTS.gg.md` |

### Manual Setup

If you prefer manual setup, create symlinks yourself:

```bash
# Codex
ln -s /path/to/gg-agents.md/AGENTS.gg.md ~/.codex/AGENTS.md

# Claude Code
ln -s /path/to/gg-agents.md/AGENTS.gg.md ~/.claude/CLAUDE.md
```

## Customization

Feel free to fork this repository and customize the `AGENTS.gg.md` file to match your own preferences.

## Structure

```
.
├── AGENTS.gg.md       # Main deliverable: agent's global instruction file (symlink source)
├── AGENTS.md          # Repository-local agent instructions (not for distribution)
├── LICENSE            # MIT License
├── README.md          # This file
├── scripts/
│   └── setup.sh       # Symlink setup script
└── bak/               # Backup directory (created by setup.sh)
    └── <service>/     # Per-service backup directories
```

## Contributing

This is a personal configuration repository.
 
While I'm not actively seeking contributions at this time, feel free to open an issue if you have suggestions or ideas!

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Related Tools

Primarily intended for:
- [Codex](https://openai.com/codex) - OpenAI's agent-style coding tool

May be adaptable for:
- [Claude Code](https://claude.ai/code) - Anthropic's coding-focused assistant
- [Cursor](https://cursor.com) - AI-powered code editor
- [Windsurf](https://windsurf.com) - AI-native IDE from Codeium
- Other tools that support AGENTS.md or similar instruction files

## Appendix: Terminology

Different services label their instruction systems differently. In this repository, "agent instruction file" refers to file-based, project- or user-scoped instructions.

- Codex: "instructions" in `AGENTS.md`
- Claude Code: "memory" in `CLAUDE.md`
- GitHub Copilot: "custom instructions" / "agent instructions" via `AGENTS.md` and `.github/*`
- ChatGPT: "Custom Instructions" (UI setting, not a file)

---

Made with 🤖 for better AI-assisted development
