#!/usr/bin/env bats
# Tests for setup.sh

setup() {
  # Create a temporary directory for each test
  TEST_TEMP_DIR="$(mktemp -d)"
  export HOME="${TEST_TEMP_DIR}/home"
  mkdir -p "${HOME}"

  # Get repository root directory
  REPO_DIR="$(cd "${BATS_TEST_DIRNAME}/.." && pwd)"

  # Create a mock AGENTS.gg.md for testing
  MOCK_AGENTS_FILE="${TEST_TEMP_DIR}/repo/AGENTS.gg.md"
  mkdir -p "$(dirname "${MOCK_AGENTS_FILE}")"
  echo "# Mock AGENTS.gg.md" > "${MOCK_AGENTS_FILE}"
  export MOCK_AGENTS_FILE

  # Copy setup.sh to temp repo
  mkdir -p "${TEST_TEMP_DIR}/repo/scripts"
  cp "${REPO_DIR}/scripts/setup.sh" "${TEST_TEMP_DIR}/repo/scripts/setup.sh"
}

teardown() {
  # Clean up temporary directory
  rm -rf "${TEST_TEMP_DIR}"
}

@test "setup.sh creates symlinks for all services" {
  run "${TEST_TEMP_DIR}/repo/scripts/setup.sh"
  [ "$status" -eq 0 ]

  # Check Codex symlink
  [ -L "${HOME}/.codex/AGENTS.md" ]

  # Check Claude symlink
  [ -L "${HOME}/.claude/CLAUDE.md" ]
}

@test "setup.sh creates backup of existing files" {
  # Create existing config files for all services
  mkdir -p "${HOME}/.codex"
  echo "codex content" > "${HOME}/.codex/AGENTS.md"
  mkdir -p "${HOME}/.claude"
  echo "claude content" > "${HOME}/.claude/CLAUDE.md"

  run "${TEST_TEMP_DIR}/repo/scripts/setup.sh"
  [ "$status" -eq 0 ]

  # Check Codex backup was created
  codex_backup_count=$(find "${TEST_TEMP_DIR}/repo/bak/codex" -name "*.bak" 2>/dev/null | wc -l | xargs)
  [ "$codex_backup_count" -ge 1 ]

  # Verify Codex backup content
  codex_backup_file=$(find "${TEST_TEMP_DIR}/repo/bak/codex" -name "*.bak" | head -1)
  [ "$(cat "$codex_backup_file")" = "codex content" ]

  # Check Claude backup was created
  claude_backup_count=$(find "${TEST_TEMP_DIR}/repo/bak/claude" -name "*.bak" 2>/dev/null | wc -l | xargs)
  [ "$claude_backup_count" -ge 1 ]

  # Verify Claude backup content
  claude_backup_file=$(find "${TEST_TEMP_DIR}/repo/bak/claude" -name "*.bak" | head -1)
  [ "$(cat "$claude_backup_file")" = "claude content" ]
}

@test "setup.sh fails when AGENTS.gg.md is missing" {
  # Remove the mock AGENTS.gg.md
  rm "${MOCK_AGENTS_FILE}"

  run "${TEST_TEMP_DIR}/repo/scripts/setup.sh"
  [ "$status" -eq 1 ]
  [[ "$output" == *"Error"* ]]
}

@test "setup.sh symlinks point to correct target" {
  run "${TEST_TEMP_DIR}/repo/scripts/setup.sh"
  [ "$status" -eq 0 ]

  # Verify symlink targets
  codex_target=$(readlink "${HOME}/.codex/AGENTS.md")
  [[ "$codex_target" == *"AGENTS.gg.md" ]]

  claude_target=$(readlink "${HOME}/.claude/CLAUDE.md")
  [[ "$claude_target" == *"AGENTS.gg.md" ]]
}

@test "setup.sh replaces existing symlinks" {
  # Create existing symlink pointing elsewhere
  mkdir -p "${HOME}/.codex"
  ln -s "/some/other/path" "${HOME}/.codex/AGENTS.md"

  run "${TEST_TEMP_DIR}/repo/scripts/setup.sh"
  [ "$status" -eq 0 ]

  # Symlink should now point to AGENTS.gg.md
  codex_target=$(readlink "${HOME}/.codex/AGENTS.md")
  [[ "$codex_target" == *"AGENTS.gg.md" ]]
}
