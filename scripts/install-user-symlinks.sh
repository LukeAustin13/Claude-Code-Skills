#!/usr/bin/env bash
# install-user-symlinks.sh
# Creates symlinks from ~/.claude/ to this repo's standalone/user/ assets.
# Covers: skills/, agents/, CLAUDE.md, settings.json

set -e

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CLAUDE_DIR="$HOME/.claude"
USER_SRC="$REPO_ROOT/standalone/user"
SKILLS_SRC="$USER_SRC/skills"
AGENTS_SRC="$USER_SRC/agents"
SKILLS_DST="$CLAUDE_DIR/skills"
AGENTS_DST="$CLAUDE_DIR/agents"

link_file() {
  local src="$1"
  local dst="$2"
  if [ -e "$dst" ]; then
    echo "Already exists, skipping: $dst"
  else
    ln -s "$src" "$dst"
    echo "Linked: $dst -> $src"
  fi
}

mkdir -p "$CLAUDE_DIR"

echo "Installing CLAUDE.md..."
link_file "$USER_SRC/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"

echo "Installing settings.json..."
link_file "$USER_SRC/settings.example.json" "$CLAUDE_DIR/settings.json"

echo "Installing skills..."
mkdir -p "$SKILLS_DST"
for item in "$SKILLS_SRC"/*/; do
  link_file "$item" "$SKILLS_DST/$(basename "$item")"
done

echo "Installing agents..."
mkdir -p "$AGENTS_DST"
for agent in "$AGENTS_SRC"/*.md; do
  link_file "$agent" "$AGENTS_DST/$(basename "$agent")"
done

echo "Done."
