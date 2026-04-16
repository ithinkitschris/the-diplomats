# Codex config for The Diplomats

This directory is the version-controlled Codex host adapter for The Diplomats. Claude Code and Codex share the same knowledge files, directives, and generated agents.

## Layout

```
.codex/
├── config.toml
├── skills/
│   ├── setup/SKILL.md
│   ├── add-agent/SKILL.md
│   ├── align/SKILL.md
│   ├── close/SKILL.md
│   ├── debrief/SKILL.md
│   └── menu/SKILL.md
└── templates/
    └── agent-skill.md
```

## Bootstrap

```bash
# 1. Install Codex CLI
npm install -g @openai/codex
codex login

# 2. Clone the repo
git clone https://github.com/[username]/the-diplomats.git
cd the-diplomats

# 3. Sync Codex config + skills into ~/.codex
bash scripts/sync-codex.sh

# 4. Start Codex in the repo and run setup
codex
```

Then ask Codex to run `setup` (or type `/setup` if you prefer that style).

## After setup or add-agent

`setup` and `add-agent` create user-specific agent skills in `.codex/skills/{agent-name}/`. Rerun this after those changes so the new skill is linked into `~/.codex/skills`:

```bash
bash scripts/sync-codex.sh
```

## Notes

- This starter kit does **not** use Codex hooks by default.
- If you already manage a custom `~/.codex/config.toml`, the sync script will not overwrite a non-symlink config file.
