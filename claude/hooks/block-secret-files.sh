#!/usr/bin/env bash
# PreToolUse hook: block reads/writes that target obvious secret files.
# Wire up in settings.json under hooks.PreToolUse with matcher "Read|Write|Edit".
#
# Hook contract (Claude Code):
# - Receives a JSON payload on stdin with tool_name and tool_input.
# - Exit 0 to allow, exit 2 to block (stderr is shown to the model).

set -euo pipefail

payload="$(cat)"

# Extract the file path from common tool inputs without requiring jq.
path="$(printf '%s' "$payload" | sed -n 's/.*"file_path"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')"

if [[ -z "$path" ]]; then
  exit 0
fi

case "$(basename "$path")" in
  .env|.env.*|id_rsa|id_ed25519|*.pem|*.key)
    echo "Blocked by hook: refusing to touch secret-like file '$path'." >&2
    exit 2
    ;;
esac

case "$path" in
  */secrets/*|*/.ssh/*|*/.aws/credentials)
    echo "Blocked by hook: refusing to touch secret-like file '$path'." >&2
    exit 2
    ;;
esac

exit 0
