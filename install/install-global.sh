#!/usr/bin/env bash
# Installs Blueprint globally for Claude Code.
# Commands and agents are available from any project without copying files
# into each project's .claude/ directory.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CLAUDE_DIR="${HOME}/.claude"
SUPPORT_DIR="$CLAUDE_DIR/blueprint"

mkdir -p "$CLAUDE_DIR/commands" "$CLAUDE_DIR/agents"
mkdir -p "$SUPPORT_DIR/methodology" "$SUPPORT_DIR/templates"

cp -f "$SCRIPT_DIR"/.claude/commands/*.md "$CLAUDE_DIR/commands/"
cp -f "$SCRIPT_DIR"/.claude/agents/*.md "$CLAUDE_DIR/agents/"
cp -rf "$SCRIPT_DIR"/methodology/. "$SUPPORT_DIR/methodology/"
cp -rf "$SCRIPT_DIR"/templates/. "$SUPPORT_DIR/templates/"

# Global prompts cannot rely on the current project's relative paths.
for file in "$CLAUDE_DIR"/commands/blueprint*.md "$CLAUDE_DIR"/agents/*.md; do
  sed -i '' \
    -e "s|methodology/|$SUPPORT_DIR/methodology/|g" \
    -e "s|templates/|$SUPPORT_DIR/templates/|g" \
    "$file"
done

echo "Blueprint installed globally for Claude Code:"
echo "  Commands: $CLAUDE_DIR/commands/blueprint*.md"
echo "  Agents:   $CLAUDE_DIR/agents/*.md"
echo "  Support:  $SUPPORT_DIR/{methodology,templates}"
echo ""
echo "Open any project in Claude Code and run: /blueprint"
