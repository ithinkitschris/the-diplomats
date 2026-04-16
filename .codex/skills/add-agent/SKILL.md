---
name: add-agent
description: Add a new personalized agent. Use when the user says "add agent", "/add-agent", "I want another agent", or asks to create a second specialist.
---

# add-agent — Codex Agent Creation Flow

Read `.claude/commands/add-agent.md` first and execute that flow.

## Codex-specific adjustments

- Ask one short question at a time in plain conversation instead of using `AskUserQuestion`.
- Check `knowledge/agent-map.md` before proposing names or domains. Avoid conflicts with existing agents and existing `.codex/skills/{agent-name}/` directories.
- Generate both host surfaces for the new agent:
  - `.claude/commands/{agent-name}.md`
  - `.codex/skills/{agent-name}/SKILL.md` from `.codex/templates/agent-skill.md`
- Update both `CLAUDE.md` and `AGENTS.md` so their agent tables stay in sync.
- In the confirmation, mention `bash scripts/sync-codex.sh` so the generated skill can be linked into `~/.codex/skills`.
