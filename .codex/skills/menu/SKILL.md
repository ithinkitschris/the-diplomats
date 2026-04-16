---
name: menu
description: Show the current agents and system commands. Use when the user says "menu", "/menu", "what agents do I have?", or asks how to use the system.
---

# menu — Codex Command Reference

If `knowledge/core/identity.md` does not exist yet, tell the user to run `setup` / `/setup` first and stop.

Read `knowledge/agent-map.md` and then present a concise reference card adapted from `.claude/commands/menu.md`.

## Codex-specific adjustments

- Show the same agents table from `knowledge/agent-map.md`.
- Note that in Claude Code the user invokes agents with slash commands, while in Codex they can say the agent's name directly.
- List the shared system capabilities: `setup`, `close`, `align`, `add-agent`, `debrief`, and `menu`.
