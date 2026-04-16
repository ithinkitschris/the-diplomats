---
name: setup
description: First-time setup for The Diplomats. Use when the user says "setup", "/setup", "initialize this system", or before `knowledge/core/identity.md` exists.
---

# setup — Codex Setup Flow

Read `.claude/commands/setup.md` first and follow its phase structure exactly.

## Codex-specific adjustments

- Ask one short question at a time in plain conversation. Do not mention `AskUserQuestion` or tool limitations.
- When the Claude flow wants multiple-choice options, present a short flat list with the recommended option first.
- Do not generate any files until the file-generation phase.
- During file generation, create both host surfaces:
  - `.claude/commands/{agent-name}.md`
  - `.codex/skills/{agent-name}/SKILL.md` from `.codex/templates/agent-skill.md`
  - `knowledge/agent-map.md`
  - `CLAUDE.md`
  - `AGENTS.md`
- When updating host docs, keep the Claude and Codex agent tables aligned.
- In the guided first session, if you're in Codex, invoke the agent by name after loading their files; do not require a slash command to continue the session.
- After generation, tell the user to run `bash scripts/sync-codex.sh` if they want the new agent skill linked into `~/.codex/skills`.
