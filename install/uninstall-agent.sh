#!/usr/bin/env bash
# Removes one Claude Code agent definition from a project or global install.
#
# Usage:
#   ./install/uninstall-agent.sh <agent-name> [project-directory]
#   ./install/uninstall-agent.sh --global <agent-name>

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  uninstall-agent.sh <agent-name> [project-directory]
  uninstall-agent.sh --global <agent-name>

Examples:
  uninstall-agent.sh scope-assessor /path/to/project
  uninstall-agent.sh --global scope-assessor
EOF
}

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  usage >&2
  exit 2
fi

if [ "$1" = "--global" ]; then
  if [ "$#" -ne 2 ]; then
    usage >&2
    exit 2
  fi
  AGENT_NAME="$2"
  CLAUDE_DIR="${HOME}/.claude"
  SCOPE="global"
else
  AGENT_NAME="$1"
  TARGET="${2:-.}"
  if [ ! -d "$TARGET" ]; then
    echo "Target project directory does not exist: $TARGET" >&2
    exit 1
  fi
  TARGET="$(cd "$TARGET" && pwd)"
  CLAUDE_DIR="$TARGET/.claude"
  SCOPE="project"
fi

case "$AGENT_NAME" in
  ''|*[!a-z0-9-]*)
    echo "Invalid agent name: $AGENT_NAME" >&2
    echo "Use lowercase letters, numbers, and hyphens only." >&2
    exit 2
    ;;
esac

AGENT_FILE="$CLAUDE_DIR/agents/$AGENT_NAME.md"

if [ ! -f "$AGENT_FILE" ]; then
  echo "Agent is not installed at: $AGENT_FILE" >&2
  exit 1
fi

rm -- "$AGENT_FILE"

echo "Removed $SCOPE agent: $AGENT_NAME"
echo "  $AGENT_FILE"

if [ -d "$CLAUDE_DIR/commands" ] &&
   grep -R -l -F -- "$AGENT_NAME" "$CLAUDE_DIR/commands" >/dev/null 2>&1; then
  echo ""
  echo "Warning: installed commands still reference '$AGENT_NAME'." >&2
  echo "Those workflows may fail until you update or reinstall them." >&2
fi

echo "Start a new Claude Code session to ensure the agent is unloaded."