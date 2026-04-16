# [Your System Name]

> A personal AI augmentation system built on your own knowledge.

---

## What This Is

Personalized AI agents that know who you are, how you think, and what you're working on. Not a generic chatbot — agents grounded in your own knowledge base, with persistent memory across sessions.

This repo supports **Claude Code** and **Codex**. Run setup once to build your system and activate your first agent. After that, you have a working personal augmentation system on both hosts.

---

## Architecture

```
Your Knowledge (knowledge/core/ + knowledge/context/)
    Plain text files you own. Who you are, how you think, what matters right now.
    |
Agents (knowledge/directive/)
    Behavioral layer. Each agent has a domain, a character, and a way of engaging.
    |
Sessions (.claude/commands/{agent-name}.md + .codex/skills/{agent-name}/SKILL.md)
    How each agent loads your knowledge and activates on each host.
```

**The PKG boundary:** Agents read your knowledge. They do not rewrite it during sessions. Your core files are yours — maintained by you, corrected by you. Agent state (working memory) is separate and updated by `close`.

**Sessions are stateless by default.** Every session starts fresh from your files. `close` / `/close` is how agents remember — it writes what happened to their state file. Without it, the next session starts from scratch.

---

## Your Agents

| Agent | Archetype | Claude Command |
|-------|-----------|----------------|
| *Run setup to populate this table* | | |

---

## Commands

In **Claude Code**, use slash commands. In **Codex**, ask for the same capability in plain language or use the same slash form if you prefer.

| Capability | What it does |
|------------|--------------|
| `setup` / `/setup` | First-time setup — run once to build your knowledge base and first agent |
| `{agent-name}` / `/{agent-name}` | Start a session with that agent |
| `close` / `/close` | End-of-session state update — run after any meaningful session |
| `align` / `/align` | State accuracy check — run when things have shifted |
| `add-agent` / `/add-agent` | Add a new agent to your system |
| `debrief` / `/debrief` | Structured reflection on your experience with the system |
| `menu` / `/menu` | Show your agents and commands |

---

## Design Principles

1. **Augment, don't replace** — every capability should make you more capable, not less
2. **You own your knowledge** — plain text files on your machine, readable at any time
3. **No dead ends** — every state has an exit; `align` / `/align` can always correct what's drifted
4. **Knowledge is the foundation** — the PKG is what makes augmentation personal, not the AI
5. **Convenience and control are not zero-sum** — good design delivers both

---

## Behavioral Rules (all agents, always)

**Anti-hallucination.** Agents never infer, fabricate, or narrativize details not explicitly in source files. If information is missing, they say so.

**Action over philosophy.** When you give a concrete directive, agents execute immediately.

**Never confirm an action not taken.** If an agent cannot execute something, it says so clearly. It does not respond as if the action succeeded.

---

## Privacy

All knowledge files live locally on your machine. Nothing is sent to external servers beyond the conversation context for the host you're using. The PKG is yours — export it, delete it, or read it anytime.

---

## Fresh Install Detection

When `knowledge/core/identity.md` does not exist, the system has not been set up yet.

On any message from a user before setup: tell them to run `setup` / `/setup` first. Explain in one sentence that setup takes about 20-30 minutes, walks them through everything, and builds their knowledge base and first agent.

Do not attempt to be helpful in any other way before setup is complete. There is nothing to work with yet.

---

## Dispatch Mode (after setup)

When setup is complete (`knowledge/core/identity.md` exists) but no agent has been explicitly invoked in this session:

1. Read `knowledge/agent-map.md` to see available agents
2. Read `knowledge/context/priorities.md` to understand what's most pressing
3. Recommend which agent the user should invoke, with a specific reason and how to invoke them
4. Briefly note the session rhythm: invoke → work → `close`

This fires once per session. After the user invokes an agent, step back.

---

## For Agents: Domain Overflow

When you notice a conversation consistently drifting into territory that belongs to a different agent's domain, flag it once: "This sounds like [other domain] territory — you might want to `add-agent` / `/add-agent` if you don't have a dedicated one." Say it once. Don't repeat.
