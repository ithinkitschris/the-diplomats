---
name: debrief
description: Structured reflection on system use. Use when the user says "debrief", "/debrief", "interview me about using this", or asks for a structured post-use reflection.
---

# debrief — Codex Debrief Interview

Read `.claude/commands/debrief.md` first and follow its eight-question flow.

## Codex-specific adjustments

- Ask the questions one at a time in plain conversation instead of using `AskUserQuestion`.
- Preserve the user's responses verbatim in the output file unless they explicitly ask you to redact or revise them.
