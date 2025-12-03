# GG AGENTS.md

Personal **G**eneral **G**lobal **AGENTS.md** ― A universal configuration profile for AI coding agents.

## Overview

This repository contains my personal AGENTS.md configuration file ([AGENTS.gg.md](AGENTS.gg.md) in this project) that provides consistent guidelines and preferences for AI coding agents (like Claude Code, Cursor, Windsurf, etc.) across all my projects and tools.

By maintaining a single, centralized AGENTS.gg.md file, I ensure that AI assistants understand my development workflow, coding standards, and safety practices regardless of which project I'm working on.

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
- Create symlinks from each AI agent's global config to `AGENTS.gg.md`
- Backup any existing config files to `bak/<service>/` before overwriting

### Supported Services

| Service | Config Path | Symlink Target |
|---------|-------------|----------------|
| [Codex](https://github.com/openai/codex/blob/main/docs/agents_md.md) | `~/.codex/AGENTS.md` | `AGENTS.gg.md` |
| [Claude Code](https://www.claude.com/blog/using-claude-md-files) | `~/.claude/CLAUDE.md` | `AGENTS.gg.md` |

### Manual Setup

If you prefer manual setup, create symlinks yourself:

```bash
# Codex
ln -sf /path/to/gg-agents.md/AGENTS.gg.md ~/.codex/AGENTS.md

# Claude Code
ln -sf /path/to/gg-agents.md/AGENTS.gg.md ~/.claude/CLAUDE.md
```

## Customization

Feel free to fork this repository and customize the `AGENTS.gg.md` file to match your own preferences.

## Structure

```
.
├── AGENTS.gg.md       # Main configuration file for AI agents
├── LICENSE            # MIT License
└── README.md          # This file
```

## Contributing

This is a personal configuration repository.
 
While I'm not actively seeking contributions at this time, feel free to open an issue if you have suggestions or ideas!

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Related Tools

This configuration works well with:
- [Claude Code](https://claude.ai/code) - Anthropic's official CLI for Claude
- [Cursor](https://cursor.sh/) - AI-powered code editor
- [Windsurf](https://codeium.com/windsurf) - AI coding assistant
- Other tools that support AGENTS.md or similar configuration files

---

Made with 🤖 for better AI-assisted development
