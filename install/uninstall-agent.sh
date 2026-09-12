#!/usr/bin/env bash
# Uninstalls Blueprint from one project or from the global Claude Code setup.
# Generated intent files are never removed.
#
# Usage:
#   ./install/uninstall-agent.sh /path/to/project
#   ./install/uninstall-agent.sh --global

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

usage() {
  cat <<'EOF'
Usage:
  uninstall-agent.sh <project-directory>
  uninstall-agent.sh --global

Examples:
  uninstall-agent.sh /path/to/project
  uninstall-agent.sh --global
EOF
}

remove_file() {
  local file="$1"
  if [ -f "$file" ]; then
    rm -- "$file"
    echo "  Removed: $file"
  fi
}

if [ "$#" -ne 1 ]; then
  usage >&2
  exit 2
fi

if [ "$1" = "--global" ]; then
  CLAUDE_DIR="${HOME}/.claude"

  echo "Removing global Blueprint installation:"
  remove_file "$CLAUDE_DIR/commands/blueprint.md"
  remove_file "$CLAUDE_DIR/commands/blueprint-continue.md"

  for source in "$SCRIPT_DIR"/.claude/agents/*.md; do
    remove_file "$CLAUDE_DIR/agents/$(basename "$source")"
  done

  if [ -d "$CLAUDE_DIR/blueprint" ]; then
    rm -rf -- "$CLAUDE_DIR/blueprint"
    echo "  Removed: $CLAUDE_DIR/blueprint"
  fi
else
  TARGET="$1"
  if [ ! -d "$TARGET" ]; then
    echo "Target project directory does not exist: $TARGET" >&2
    exit 1
  fi
  TARGET="$(cd "$TARGET" && pwd)"

  if [ "$TARGET" = "$SCRIPT_DIR" ]; then
    echo "Refusing to uninstall from the Blueprint source repository." >&2
    exit 2
  fi

  echo "Removing Blueprint from: $TARGET"
  for source in "$SCRIPT_DIR"/.claude/commands/*.md; do
    remove_file "$TARGET/.claude/commands/$(basename "$source")"
  done
  for source in "$SCRIPT_DIR"/.claude/agents/*.md; do
    remove_file "$TARGET/.claude/agents/$(basename "$source")"
  done

  for source_root in methodology templates; do
    while IFS= read -r -d '' source; do
      relative_path="${source#"$SCRIPT_DIR/$source_root/"}"
      remove_file "$TARGET/$source_root/$relative_path"
    done < <(find "$SCRIPT_DIR/$source_root" -type f -print0)
  done
fi

echo "Blueprint uninstall complete. Generated intent files were preserved."
echo "Start a new Claude Code session to unload the removed agents."