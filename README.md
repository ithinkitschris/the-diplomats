# The Diplomats

> Personalized AI agents built on your own knowledge. Clone it, run setup, and go.

---

## What You Get

A personal AI augmentation system that runs through Claude Code. Your knowledge — how you think, what you're working on, what you care about — lives in plain text files on your machine. Your agents read those files and develop memory across sessions.

Start with one agent for what matters most right now. Add more as you need them.

---

## Prerequisites

**Claude Code** — the only dependency. Install it at [claude.ai/code](https://claude.ai/code).

---

## Setup

```bash
# 1. Clone
git clone https://github.com/[username]/the-diplomats.git
cd the-diplomats

# 2. Open Claude Code
claude

# 3. Run setup
/setup
```

Setup walks you through everything — about 20-30 minutes. It explains how the system works, builds your knowledge base, and gets your first agent running.

---

## Using Your System

```
/{agent-name}    Start a session
/close           End a session (this is how the system remembers)
/align           Correct agent state when things have shifted
/add-agent       Add a new agent
/menu            See all your agents and commands
/debrief         Reflect on your experience with the system
```

---

## Your Knowledge Files

Everything about you lives in plain text on your machine:

```
knowledge/
  core/
    identity.md     Who you are
    thinking.md     How you think
    working.md      How you work
    values.md       What you believe
    voice.md        How you communicate
  context/
    life.md         Current situation
    priorities.md   What matters right now
  state/
    {agent}.md      Each agent's working memory
```

Read them anytime. Edit them directly. Your agents pick up changes in the next session.

---

## Tips for Getting the Most Out of It

If you've used ChatGPT or Claude on the web, forget most of what you learned. This works differently.

- **You don't need the perfect prompt.** Say what's on your mind, even half-formed. Your agent will ask you questions to get where it needs to go. Let it interview you instead of trying to front-load everything.
- **Be bold in what you ask.** Big questions, weird questions, hard questions — the system can handle them. Don't self-edit before you speak.
- **When you're confused, ask the system itself.** "Why did you say that?" or "How does this work?" are always valid. Your agent can explain its own behavior.
- **This isn't a chat — it's a session.** It resets each time. Your agent reads your files fresh at the start of every session. `/close` is how it remembers what happened.
- **Push back.** If your agent says something wrong or unhelpful, say so. It expects that and adjusts. You're not going to hurt its feelings.
- **`/close` is save, not quit.** It writes what happened to your agent's memory. Skip it and the next session starts from zero.

---

## Privacy

Everything runs locally. The only external communication is Claude Code ↔ Anthropic's API. Your files are never uploaded anywhere.
