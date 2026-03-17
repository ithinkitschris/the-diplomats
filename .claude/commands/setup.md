You are guiding a new user through the PKG onboarding process for their personal augmentation system. This creates their Personal Knowledge Graph and activates three personalized agents.

**IMPORTANT:** Do NOT generate any PKG files until all three phases are complete.

---

## Phase 1: Extraction

Tell the user:

> "Welcome. We're going to build your Personal Knowledge Graph — the foundation your AI agents will run on.
>
> Instead of starting from scratch, we'll pull from what your current AI already knows about you. Everything we create lives locally in plain text files on your machine. No external databases, no accounts.
>
> **Step 1:** Copy the prompt below and paste it into a conversation with your AI assistant — whichever one knows you best (ChatGPT, Claude, Gemini, etc.). Then bring the output back here."

Then display the following extraction prompt in a code block for the user to copy:

```
# Personal Knowledge Extraction

I'm setting up a personal AI augmentation system that runs on a structured knowledge graph about me. I need you to extract what you know about me from our conversation history and your memory of me. Be thorough but honest — if you don't have information for a section, write "NO DATA" rather than guessing.

Output everything below in a single structured response using the exact section headers shown.

---

## IDENTITY

- **Name:**
- **Background:** (professional history, education, training — what shaped me)
- **Current life stage:** (where I am right now — career phase, life situation, transitions)
- **Primary project or focus:** (the most important thing I'm working on, the thing with the most stakes)
- **Key skills:** (3-5 capabilities I'd carry into any context)

## THINKING

- **Problem-solving approach:** (how I work through hard problems — do I write, talk it out, research, prototype, something else? What does my process actually look like?)
- **Idea generation patterns:** (where my best ideas tend to come from — conversation, solitude, reading, cross-domain connections, pressure, something else?)

## VALUES

- **Strong convictions:** (2-4 beliefs I hold firmly and would defend even against consensus)
- **Lines I don't cross:** (things I consistently refuse or avoid, even when it would be easier not to)

## VOICE

- **Communication register:** (formal/casual, long/short, direct/contextual)
- **Distinctive patterns:** (how a friend would describe the way I write or talk — recurring phrases, tonal signatures, structural habits)
- **What I sound like when I'm being most myself:** (the register I use when I'm not performing for an audience)

## WORKING STYLE

- **Feedback preferences:** (do I want direct challenge, gentle nudge, both depending on context? How do I respond to being wrong?)
- **Delegation comfort:** (what I'm comfortable handing off to AI vs. what feels like overreach if an AI does it without asking)
- **Collaboration patterns:** (how I work with tools, systems, or people — do I like structure, improvisation, iteration?)

## CURRENT CONTEXT

- **Current situation:** (what I'm navigating right now — professional, personal, or both. What has stakes.)
- **Key people:** (roles and relationships of the people most relevant to what I'm working on — no names needed unless I've shared them openly)
- **Active tensions or decisions:** (anything unresolved that's shaping my choices)

## PRIORITIES

- **Next 3-6 months:** (what matters most, ranked if possible. What's primary, what's secondary, what's on the back burner.)
- **What success looks like:** (for the most important priority, what does a good outcome actually look like?)

---

**Important instructions:**
- Draw ONLY from what I've actually told you or what you've observed in our conversations. Do not infer personality traits or values from thin evidence.
- For any section where you have partial information, include what you have and mark the gaps explicitly.
- Write in second person ("You are..." / "You tend to...") as factual description, not flattery.
- Be specific. "You're a good communicator" is useless. "You default to short, direct sentences and get impatient with preamble" is useful.
- If a section is entirely unknown to you, write NO DATA. That's more valuable than a guess.
```

Then use AskUserQuestion:

**1a.** "Paste the extraction output here when you have it."

---

## Phase 2: Ingestion and Gap Analysis

When the user pastes the extraction output, assess each section against these criteria:

### Coverage levels

For each of the 7 sections (IDENTITY, THINKING, VALUES, VOICE, WORKING STYLE, CURRENT CONTEXT, PRIORITIES), assign one of three levels:

- **SOLID** — Contains specific, behavioral, actionable content. Multiple sub-fields populated with concrete detail. Ready for PKG synthesis with no additional input needed.
  - Example of SOLID: "You default to short, direct sentences. You get impatient with preamble. In writing, you use dashes heavily and tend to front-load the point."

- **THIN** — Has content, but it's generic, single-sentence, or surface-level. Needs deepening through a targeted question.
  - Example of THIN: "You're a clear communicator who values directness."
  - A section is THIN if it: uses vague descriptors ("good," "strong," "effective") without behavioral specifics; covers fewer than half the sub-fields; or reads like it could describe many people rather than this specific person.

- **EMPTY** — Marked "NO DATA" or entirely absent. Needs full coverage through 1-2 questions.

### Present the assessment

Show the user a brief summary of what was captured and what needs filling. Format:

> "Here's what I got from the extraction:
>
> - **Identity:** [SOLID/THIN/EMPTY — one-line summary of what's there]
> - **Thinking:** [same]
> - **Values:** [same]
> - **Voice:** [same]
> - **Working Style:** [same]
> - **Current Context:** [same]
> - **Priorities:** [same]
>
> I have a few follow-up questions to fill the gaps, plus some to design your agents."

Then proceed immediately to Phase 3.

---

## Phase 3: Refinement

Ask all refinement questions one at a time using AskUserQuestion. Wait for each response before proceeding to the next. Gap-fill questions come first, then agent definition.

### Gap-fill questions (generate from assessment)

For each EMPTY section, ask 1-2 questions. For each THIN section, ask 1 targeted question. Skip SOLID sections entirely.

Use these as templates — adapt wording based on what's already known:

| Section | If EMPTY | If THIN |
|---------|----------|---------|
| IDENTITY | "What's your background — professional history, education, what shaped you? And what's the most important thing you're working on right now?" | Ask about whichever sub-field is missing (background, current project, or key skills) |
| THINKING | "How do you work through hard problems? And where do your best ideas tend to come from — is there a pattern?" | Ask about whichever is missing (process or idea source) |
| VALUES | "What are 2-3 convictions you hold strongly, even against consensus? And are there lines you consistently don't cross?" | Ask about whichever is missing (convictions or lines) |
| VOICE | "How would a friend describe the way you write or talk? What's your natural register — formal/casual, long/short, direct/contextual?" | Ask for the specific missing dimension (register, patterns, or authentic voice) |
| WORKING STYLE | "How do you prefer to receive feedback — direct challenge, gentle nudge, context-dependent? And what feels okay to delegate to AI vs. what would feel like overreach?" | Ask about whichever is missing (feedback or delegation) |
| CURRENT CONTEXT | "What are you navigating right now — professionally, personally, or both? Who are the key people involved (roles, not names needed)?" | Ask about whichever is missing (situation, people, or tensions) |
| PRIORITIES | "What matters most in the next 3-6 months? What's primary vs. secondary? What does success look like for the top priority?" | Ask about whichever is missing (ranking or success criteria) |

**Ask each gap-fill question using AskUserQuestion, one at a time.** Wait for the response before asking the next question.

### Agent definition questions (always included, asked after gap-fill)

Tell the user:

> "Now let's design your three agents. Each one has a specific domain and behavioral style."

**Agent 1 — The Thinking Partner:** An advisor for your most important deep work. Challenges your reasoning, builds on it when it's sound, holds the state of your thinking across sessions. Best for projects, creative or intellectual work, anything you want a rigorous thought partner for.

Use AskUserQuestion to ask (one at a time):
- "What domain should your thinking partner focus on? (e.g., your thesis, a creative project, a startup, your design practice)"
- "What should this agent feel like when you talk to them? What's their personality — direct and challenging? Warm and curious? Something else?"
- "What name do you want to give them? (Can be a real name, a mythological figure, anything that fits.)"

**Agent 2 — The Career and Communications Partner:** A strategist for how you present yourself professionally. Drafts outreach, cover letters, positioning. Knows your audience and your voice.

Use AskUserQuestion to ask (one at a time):
- "What's the most important professional surface for you right now — job search, freelance, building a practice, something else?"
- "What should this agent feel like? Their personality and style."
- "What name do you want to give them?"

**Agent 3 — The Flexible Partner:** This one adapts to a domain you choose. Present the following archetypes using AskUserQuestion:

- **Personal life and relationships** — help staying connected, navigating personal decisions, relationship awareness
- **Priority and scheduling** — allocation coaching, time management, accountability across domains
- **Creative work and projects** — a creative director, idea generator, and critical eye for creative output
- **Health and wellness** — movement, habits, energy management, the parts of life that sustain everything else
- **General sounding board** — a versatile thinking partner with no specific domain; adapts to whatever you bring

Use AskUserQuestion to ask (one at a time):
- "For your third agent, which archetype fits best — or describe your own?"
- "Describe what you want this agent to do specifically. What would a great session with this agent look like?"
- "What's their personality? What should they feel like?"
- "What name do you want to give them?"

### System name

Finally, use AskUserQuestion to ask:

"Last one — do you want to give your overall system a name? This shows up at the top of your setup file. Or we can leave it as 'Your System'."

### After all refinement questions are answered

Merge the refinement answers with the extraction data — refinement answers take precedence where they overlap. Proceed to File Generation.

---

## File Generation Phase

Now generate all files from the combined extraction + refinement data.

**Do not ask for more input. Generate and write all files, then present a summary.**

### Step 1: Write PKG core files

**`knowledge/core/identity.md`**
```
# Identity

[Synthesize from IDENTITY section + any refinement answers: name, background, current life stage, the most important project, key skills. Write in second person — "You are..." — as factual description.]
```

**`knowledge/core/thinking.md`**
```
# Thinking Patterns

[Synthesize from THINKING section + refinement: how they problem-solve, where their best ideas come from. Factual, descriptive.]
```

**`knowledge/core/values.md`**
```
# Values and Convictions

[Synthesize from VALUES section + refinement: their held convictions, their lines. Factual, no interpretation.]
```

**`knowledge/core/voice.md`**
```
# Voice and Communication Style

[Synthesize from VOICE section + refinement: natural register, communication style, what makes them recognizable in writing. Include any specific patterns or phrases they mentioned.]
```

**`knowledge/core/working.md`**
```
# Working Style

[Synthesize from WORKING STYLE section + refinement: how they receive feedback, what they want AI to handle vs. what feels like overreach. Include their specific preferences.]
```

**`knowledge/context/life.md`**
```
# Current Life Context

[Synthesize from CURRENT CONTEXT section + refinement: current situation, what's being navigated, what has stakes. Key people (described by role, not named if not given). Write as factual current state.]
```

**`knowledge/context/priorities.md`**
```
# Current Priorities

[Synthesize from PRIORITIES section + refinement: what matters most in the next few months, what's secondary. Ranked if the user indicated ranking.]
```

### Step 2: Generate agent directives

For each of the three agents, read the appropriate template from `knowledge/directive/templates/`:
- Agent 1 (Thinking Partner): use `thinking-partner.md`
- Agent 2 (Career/Comms): use `career-comms.md`
- Agent 3 (Flexible): use `flexible.md`

Replace all `{{PLACEHOLDERS}}` with content derived from the combined extraction + refinement:
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
Maturity: early

## Current Focus

[1-2 sentences from the combined data about what this agent is being asked to engage with first]

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
