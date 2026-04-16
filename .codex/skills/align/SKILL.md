---
name: align
description: State alignment walk. Use when the user says "align", "/align", "check whether my agent state is still current", or wants to correct drift after something changed.
---

# align — Codex State Alignment

Read `.claude/commands/align.md` first and follow that protocol.

## Codex-specific adjustments

- Detect the active agent from either slash-style invocations or direct agent-name invocations in the thread.
- If the active agent is unclear, ask plainly which agent to align after reading `knowledge/agent-map.md`.
- Ask one section-at-a-time question in plain conversation instead of using `AskUserQuestion`.
