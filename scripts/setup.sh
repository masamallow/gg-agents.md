#!/usr/bin/env bash
# setup.sh
# Creates symlinks from AI coding agent instruction files to AGENTS.gg.md / CLAUDE.gg.md

set -euo pipefail

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "${SCRIPT_DIR}")"
AGENTS_FILE="${REPO_DIR}/AGENTS.gg.md"
CLAUDE_FILE="${REPO_DIR}/CLAUDE.gg.md"
BACKUP_DIR="${REPO_DIR}/bak"
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")

# Service configurations: "config_dir:config_file:backup_name:source_file"
SERVICES=(
  "${HOME}/.codex:AGENTS.md:codex:${AGENTS_FILE}"
  "${HOME}/.claude:CLAUDE.md:claude:${CLAUDE_FILE}"
)

# Verify source files exist
for src in "${AGENTS_FILE}" "${CLAUDE_FILE}"; do
  if [[ ! -f "${src}" ]]; then
    echo "Error: $(basename "${src}") not found at ${src}" >&2
    exit 1
  fi
done

# Create backup root directory
mkdir -p "${BACKUP_DIR}"

created_symlinks=()

for service in "${SERVICES[@]}"; do
  IFS=':' read -r config_dir config_file backup_name source_file <<< "${service}"
  target_file="${config_dir}/${config_file}"
  service_backup_dir="${BACKUP_DIR}/${backup_name}"

  # Create service config directory
  mkdir -p "${config_dir}"

  # Create service backup directory
  mkdir -p "${service_backup_dir}"

  # Backup existing file if it exists
  if [[ -f "${target_file}" ]]; then
    backup_file="${service_backup_dir}/${config_file}.${TIMESTAMP}.bak"
    cp "${target_file}" "${backup_file}"
    echo "Backed up: ${target_file} -> ${backup_file}"
  fi

  # Create symlink (force overwrite if exists)
  ln -sf "${source_file}" "${target_file}"
  created_symlinks+=("${target_file}")
done

echo ""
echo "Setup complete!"
echo ""
echo "Created symlinks:"
ls -la "${created_symlinks[@]}"
