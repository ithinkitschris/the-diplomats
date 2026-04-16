#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"

mkdir -p "$CODEX_HOME/skills"

if [ -e "$CODEX_HOME/config.toml" ] && [ ! -L "$CODEX_HOME/config.toml" ]; then
  echo "Skipped $CODEX_HOME/config.toml because it already exists as a regular file."
  echo "Copy or merge $ROOT_DIR/.codex/config.toml manually if you want these defaults."
else
  ln -sf "$ROOT_DIR/.codex/config.toml" "$CODEX_HOME/config.toml"
fi

for skill_dir in "$ROOT_DIR/.codex/skills"/*; do
  [ -d "$skill_dir" ] || continue
  skill_name="$(basename "$skill_dir")"
  ln -sfn "$skill_dir" "$CODEX_HOME/skills/$skill_name"
done

echo "Synced Codex skills from $ROOT_DIR/.codex/skills to $CODEX_HOME/skills."
echo "Rerun this after setup or add-agent so newly generated agent skills are linked too."
