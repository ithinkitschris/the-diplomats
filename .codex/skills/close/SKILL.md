---
name: close
description: End-of-session state update. Use when the user says "close", "/close", "save this session", or wants the active agent's memory written to state.
---

# close — Codex Session Close

Read `.claude/commands/close.md` first and execute that protocol.

## Codex-specific adjustments

- Detect the active agent from either slash-style invocations or direct agent-name invocations in the thread. The last loaded agent wins.
- Keep the close summary in the active agent's character voice.
- If the git commit fails, still report the state-file update clearly.
