#!/usr/bin/env bash
# Installs Blueprint into a target project's .claude/ directory so
# Claude Code picks up the commands and subagents natively.
#
# Usage:
#   /path/to/blueprint/install/install.sh /path/to/your-project
#   (or run from inside blueprint/: ./install/install.sh ../your-project)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${1:-.}"

if [ ! -d "$TARGET" ]; then
  echo "Target project directory does not exist: $TARGET" >&2
  exit 1
fi

TARGET="$(cd "$TARGET" && pwd)"

echo "Installing Blueprint into: $TARGET"

mkdir -p "$TARGET/.claude/commands" "$TARGET/.claude/agents"

cp -f "$SCRIPT_DIR"/.claude/commands/*.md "$TARGET/.claude/commands/"
cp -f "$SCRIPT_DIR"/.claude/agents/*.md "$TARGET/.claude/agents/"

# Copy the methodology + templates so command/agent references resolve
# relative to the target project. Adjust the destination if your project
# already has a convention for vendored docs.
mkdir -p "$TARGET/methodology" "$TARGET/templates"
cp -rf "$SCRIPT_DIR"/methodology/. "$TARGET/methodology/"
cp -rf "$SCRIPT_DIR"/templates/. "$TARGET/templates/"

mkdir -p "$TARGET/intent"

echo ""
echo "Done. Blueprint installed:"
echo "  $TARGET/.claude/commands/blueprint.md"
echo "  $TARGET/.claude/commands/blueprint-continue.md"
echo "  $TARGET/.claude/agents/*.md  (8 subagents)"
echo "  $TARGET/methodology/, $TARGET/templates/  (referenced by the above)"
echo ""
echo "Next steps, inside Claude Code at $TARGET:"
echo "  1. Add your design material (screenshots, notes, exports) to the project."
echo "  2. Run:  /blueprint"
echo "  3. Review/edit intent/BLUEPRINT.md, then run:  /blueprint-continue"
