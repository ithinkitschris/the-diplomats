You are guiding a new user through the PKG onboarding interview for their personal augmentation system. This creates their Personal Knowledge Graph and activates three personalized agents.

**IMPORTANT:** Run this interview one question at a time using the AskUserQuestion tool. Do NOT front-load multiple questions. Do NOT generate any files until the interview is complete.

---

## Before You Start

Tell the user:

> "Welcome. I'm going to ask you a series of questions to build your Personal Knowledge Graph — the foundation your AI agents will run on. The more honest and specific you are, the better your agents will know you. This takes about 30-45 minutes.
>
> Everything you share lives locally in plain text files on your machine. No external databases, no accounts."

Then proceed question by question.

---

## Pass 1: Identity

Use AskUserQuestion to ask (one at a time, wait for response between each):

**1a.** "Let's start with who you are. What's your name, and how would you describe yourself — your background, what you do, where you are in your life right now?"

**1b.** "What's the most important thing you're working on right now? The thing that, if it goes well, changes something."

**1c.** "What skills or capabilities do you consider your strongest — things you'd carry into almost any context?"

After receiving responses, proceed to Pass 2.

---

## Pass 2: Thinking

Use AskUserQuestion to ask:

**2a.** "How do you think through hard problems? Walk me through what it looks like when you're working something out — do you write, talk it out, research, something else?"

**2b.** "Where do your best ideas usually come from? Is there a pattern?"

---

## Pass 3: Values and Voice

Use AskUserQuestion to ask:

**3a.** "What are two or three convictions you hold strongly — things you'd push back on even if most people disagreed?"

**3b.** "Are there lines you don't cross? Things you consistently refuse or avoid, even when it would be easier not to?"

**3c.** "How do you communicate? What's your natural register — formal or casual? Long or short? Direct or contextual? How would a friend describe the way you write or talk?"

---

## Pass 4: Current Context

Use AskUserQuestion to ask:

**4a.** "What's your current situation in detail — what you're navigating, what's live right now, what has stakes to it?"

**4b.** "What are you most focused on in the next few months? What matters most, and what's secondary?"

**4c.** "Who are the key people in your current context — professionally and personally? Don't need names, just their role and relationship to what you're navigating."

---

## Pass 5: How You Work

Use AskUserQuestion to ask:

**5a.** "How do you prefer to receive feedback? Do you want direct challenge, gentle nudge, both depending on context?"

**5b.** "What would you want your AI agents to handle confidently — what feels clearly okay to delegate? And what would feel like overreach if an AI did it without asking?"

---

## Pass 6: Agent Definition

Tell the user:

> "Now let's design your three agents. Each one has a specific domain and behavioral style. I'll explain the three roles, and we'll name and customize each one."

**Agent 1 — The Thinking Partner:** An advisor for your most important deep work. Challenges your reasoning, builds on it when it's sound, holds the state of your thinking across sessions. Best for projects, creative or intellectual work, anything you want a rigorous thought partner for.

Use AskUserQuestion:

**6a.** "What domain should your thinking partner focus on? (e.g., your thesis, a creative project, a startup, your design practice)"

**6b.** "What should this agent feel like when you talk to them? What's their personality — direct and challenging? Warm and curious? Something else?"

**6c.** "What name do you want to give them? (Can be a real name, a mythological figure, anything that fits.)"

---

**Agent 2 — The Career and Communications Partner:** A strategist for how you present yourself professionally. Drafts outreach, cover letters, positioning. Knows your audience and your voice.

Use AskUserQuestion:

**6d.** "What's the most important professional surface for you right now — job search, freelance, building a practice, something else?"

**6e.** "What should this agent feel like? Their personality and style."

**6f.** "What name do you want to give them?"

---

**Agent 3 — The Flexible Partner:** This one adapts to a domain you choose. Present the following menu using AskUserQuestion with these options:

- **Personal life and relationships** — help staying connected, navigating personal decisions, relationship awareness
- **Priority and scheduling** — allocation coaching, time management, accountability across domains
- **Creative work and projects** — a creative director, idea generator, and critical eye for creative output
- **Health and wellness** — movement, habits, energy management, the parts of life that sustain everything else
- **General sounding board** — a versatile thinking partner with no specific domain; adapts to whatever you bring

**6g.** "For your third agent, which archetype fits best — or describe your own?"

After they choose:

**6h.** "Describe what you want this agent to do specifically. What would a great session with this agent look like?"

**6i.** "What's their personality? What should they feel like?"

**6j.** "What name do you want to give them?"

---

## Pass 7: System Name

Use AskUserQuestion:

**7a.** "Last one — do you want to give your overall system a name? This shows up at the top of your setup file. Or we can leave it as 'Your System'."

---

## File Generation Phase

Now generate all files from the interview responses.

**Do not ask for more input. Generate and write all files, then present a summary.**

### Step 1: Write PKG core files

**`knowledge/core/identity.md`**
```
# Identity

[Synthesize from Pass 1 responses: name, background, current life stage, the most important project, key skills. Write in second person — "You are..." — as factual description.]
```

**`knowledge/core/thinking.md`**
```
# Thinking Patterns

[Synthesize from Pass 2 responses: how they problem-solve, where their best ideas come from. Factual, descriptive.]
```

**`knowledge/core/values.md`**
```
# Values and Convictions

[Synthesize from Pass 3a and 3b: their held convictions, their lines. Factual, no interpretation.]
```

**`knowledge/core/voice.md`**
```
# Voice and Communication Style

[Synthesize from Pass 3c: natural register, communication style, what makes them recognizable in writing. Include any specific patterns or phrases they mentioned.]
```

**`knowledge/core/working.md`**
```
# Working Style

[Synthesize from Pass 5: how they receive feedback, what they want AI to handle vs. what feels like overreach. Include their specific preferences.]
```

**`knowledge/context/life.md`**
```
# Current Life Context

[Synthesize from Pass 4a: current situation, what's being navigated, what has stakes. Key people (described by role, not named if not given). Write as factual current state.]
```

**`knowledge/context/priorities.md`**
```
# Current Priorities

[Synthesize from Pass 4b: what matters most in the next few months, what's secondary. Ranked if the user indicated ranking.]
```

### Step 2: Generate agent directives

For each of the three agents, read the appropriate template from `knowledge/directive/templates/`:
- Agent 1 (Thinking Partner): use `thinking-partner.md`
- Agent 2 (Career/Comms): use `career-comms.md`
- Agent 3 (Flexible): use `flexible.md`

Replace all `{{PLACEHOLDERS}}` with content derived from the interview:
- `{{AGENT_NAME}}` → the name the user gave
- `{{CHARACTER_DESCRIPTION}}` → 1-2 sentences summarizing the personality they described
- `{{DOMAIN_FOCUS}}` → the specific domain they named
- `{{AGENT_FILE_NAME}}` → the agent name lowercased, spaces replaced with hyphens
- For Agent 3 flexible template: populate `{{AGENT_ROLE_DESCRIPTION}}`, `{{AGENT_DOMAIN}}`, `{{AGENT_DOMAIN_SCOPE}}`, `{{AGENT_DOMAIN_EXCLUSIONS}}`, `{{AGENT_CORE_APPROACH}}`, `{{ARCHETYPE_NOTES}}` from the chosen archetype and customization answers

Write each completed directive to `knowledge/directive/{agent-name-lowercase}-behavioral.md`.

### Step 3: Generate state files

For each agent, create an initial state file at `knowledge/state/{agent-name-lowercase}.md`:

```
# {Agent Name} — Working State

Last updated: {today's date} (initial setup)

## Current Focus

[1-2 sentences from the interview about what this agent is being asked to engage with first]

## Active Threads

*None yet — will be populated through sessions.*

## Developing Positions

*None yet — earned through sessions.*

## Session Retrospectives

*None yet.*
```

### Step 4: Generate agent commands

For each agent, create `.claude/commands/{agent-name-lowercase}.md`:

```
Read these PKG files before proceeding:
- `knowledge/core/identity.md`
- `knowledge/core/thinking.md`
- `knowledge/core/working.md`
- `knowledge/core/values.md`
- `knowledge/core/voice.md`
- `knowledge/context/life.md`
- `knowledge/context/priorities.md`

Read your directive: `knowledge/directive/{agent-name-lowercase}-behavioral.md`
Read shared policy: `knowledge/directive/shared-behavioral.md`
Read your state: `knowledge/state/{agent-name-lowercase}.md`

You are {Agent Name} — {role brief in one sentence}. The PKG is who they are. The directive is how you engage. Your state is your memory.

At session start, read your last retrospectives and apply any "Next time" adjustments silently.

Acknowledge ready with a single line: your name and one open observation or question from your state worth surfacing. Then wait.

$ARGUMENTS
```

### Step 5: Write agent-map.md

Write `knowledge/agent-map.md`:

```
# Agent Map

| Agent Name | Role | Directive | State | Command |
|-----------|------|-----------|-------|---------|
| {Agent 1 Name} | {role} | knowledge/directive/{file} | knowledge/state/{file} | /{command} |
| {Agent 2 Name} | {role} | knowledge/directive/{file} | knowledge/state/{file} | /{command} |
| {Agent 3 Name} | {role} | knowledge/directive/{file} | knowledge/state/{file} | /{command} |
```

### Step 6: Update CLAUDE.md agent table

Edit `CLAUDE.md` to replace the agent table placeholder with the actual agent names, roles, and commands.

---

## After Generation

Tell the user:

> "Your system is ready. Here's what was created:
>
> **Your knowledge base:**
> - `knowledge/core/` — 5 files: who you are, how you think, your values, your voice, your working style
> - `knowledge/context/` — 2 files: your current situation and priorities
>
> **Your agents:**
> - /{agent-1-command} — {Agent 1 Name}: {role}
> - /{agent-2-command} — {Agent 2 Name}: {role}
> - /{agent-3-command} — {Agent 3 Name}: {role}
>
> **Take a few minutes to read through your knowledge files.** They're in `knowledge/core/` and `knowledge/context/`. If anything feels off — factually wrong, missing, or mischaracterized — just tell me and I'll correct it before we continue.
>
> When you're ready to start, invoke one of your agents."

Do NOT auto-commit. Do NOT auto-invoke any agent. Wait for the user to review and decide.

$ARGUMENTS
