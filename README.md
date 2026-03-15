# The Diplomats

> A personal AI augmentation system you can clone and run in under an hour.

Three personalized agents, built on your own knowledge, running through Claude Code. No external databases. No accounts. No black-box AI that doesn't know who you are.

---

## What You Get

After setup, you'll have:

- **A Personal Knowledge Graph (PKG)** — plain text files capturing who you are, how you think, what you value, and what you're working on
- **Three AI agents**, each with a distinct domain and behavioral style, all grounded in your PKG
- **Persistent memory** — agents remember what happened across sessions through working state files
- **System commands** for structured session management: `/close`, `/align`, `/debrief`

---

## Prerequisites

**Claude Code CLI** — required. This is the only dependency.

Install it: [claude.ai/code](https://claude.ai/code)

You'll need a Claude account. Claude Code's built-in auth handles everything — no separate API key needed.

---

## Setup (30-45 minutes)

```bash
# 1. Clone the repo
git clone https://github.com/[username]/the-diplomats.git
cd the-diplomats

# 2. Open Claude Code
claude

# 3. Run setup
/setup
```

`/setup` will interview you — one question at a time — and generate all your files. After it finishes, review the generated files in `knowledge/core/` and `knowledge/context/`. If anything is off, tell Claude to correct it before you start using your agents.

---

## Using Your System

### Starting a session
```
/[agent-name]
```
Your agent loads your PKG, acknowledges ready, and waits for you.

### Ending a session
```
/close
```
Your agent writes what changed to its state file and summarizes what happened. Run this after any meaningful session.

### Checking accuracy
```
/align
```
Walk through your agent's state file section by section. Fix anything that's drifted. Use this when things have shifted — after a big decision, a life change, or when sessions start feeling off.

### Researcher debrief
```
/debrief
```
A structured 8-question interview about your experience with the system. Run this when the researcher asks.

### Command reference
```
/menu
```

---

## Your Knowledge Files

All your knowledge lives in plain text files on your machine:

```
knowledge/
  core/
    identity.md       Who you are
    thinking.md       How you think
    working.md        How you work
    values.md         What you believe
    voice.md          How you communicate
  context/
    life.md           Current situation
    priorities.md     What matters right now
  state/
    {agent-name}.md   Each agent's working memory (updated by /close)
```

You can read these files anytime. You can edit them directly. If you change something, your agent will pick it up in the next session.

---

## Privacy

Everything lives locally on your machine. The only external communication is between Claude Code and Anthropic's API — which is what powers Claude. Your knowledge files are never uploaded to a database or external service. The system is yours.

---

## For Researchers

If you're a participant in Chris Leow's MFA thesis research:

1. Run `/setup` to build your system
2. Use it for the designated inhabitation period
3. Run `/debrief` when asked — it takes about 20 minutes and produces a structured record of your experience

The debrief file saves to `debrief/YYYY-MM-DD-debrief.md` in your local repo. Share it with the researcher directly.
