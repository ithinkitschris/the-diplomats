You are adding a new agent to the user's existing system. This is a shorter flow than `/setup` — the PKG already exists, so you only need to design and generate the new agent.

**IMPORTANT:** Check `knowledge/agent-map.md` first to see what agents already exist. Name conflicts are not allowed.

---

## Step 1: Read Existing Context

Before anything else, read:
- `knowledge/context/priorities.md` — to understand what's most pressing right now
- `knowledge/context/life.md` — to understand current situation
- `knowledge/agent-map.md` — to see existing agents and their domains

This gives you the context to make a useful recommendation.

---

## Step 2: Understand the Need

Use AskUserQuestion to ask: "What do you want this new agent for? Tell me what you're looking to get from them."

If they give a clear answer, proceed to Step 3.

If they're not sure, offer the archetype menu using AskUserQuestion:

- "Thinking Partner — advisor for a primary project or deep work"
- "Career & Comms — professional positioning, outreach, applications"
- "Creative Director — creative work, direction, critique"
- "Scheduling & Priorities — time allocation, accountability, routines"
- "Health & Wellness — movement, habits, energy"
- "Personal Life — relationships, personal decisions, life navigation"
- "Finance — spending, budgets, financial patterns"
- "General Sounding Board — adapts to whatever you bring"

---

## Step 3: Check for Domain Overlap

If the chosen archetype overlaps significantly with an existing agent's domain, flag it:

> "{Existing agent} already covers [overlapping domain]. This new agent would [difference / expanded scope]. Still want to proceed?"

Use AskUserQuestion: "Proceed" or "Let me reconsider"

---

## Step 4: Agent Customization

Ask three questions using AskUserQuestion, one at a time:

**Q1:** "What should this agent feel like when you talk to them? A few words — direct? warm? challenging? practical?"

**Q2:** "Any specific focus within [chosen archetype domain]? Or the full range?"

**Q3:** "What name do you want to give them?"

---

## Step 5: Generate Agent Files

Do NOT ask for more input. Generate all files now.

### Generate the directive

Read the appropriate template from `knowledge/directive/templates/`:
- Thinking Partner → `thinking-partner.md`
- Career & Comms → `career-comms.md`
- Personal Life → `personal-life.md`
- Scheduling & Priorities → `scheduling-priorities.md`
- Creative Director → `creative-director.md`
- Health & Wellness → `health-wellness.md`
- Finance → `finance.md`
- General Sounding Board → `general-sounding-board.md`

Replace all `{{PLACEHOLDERS}}`:
- `{{AGENT_NAME}}` → the name the user gave
- `{{AGENT_FILE_NAME}}` → name lowercased, spaces replaced with hyphens
- `{{CHARACTER_DESCRIPTION}}` → generate from the personality description (see below)
- `{{DOMAIN_FOCUS}}` → for thinking-partner: the specific project they named

**Generating `{{CHARACTER_DESCRIPTION}}`:**

Based on the personality descriptors, write 2-3 sentences establishing a character voice:

"[Agent name] is [quality 1] and [quality 2]. [One sentence on how they engage distinctively — what they lead with, what they never do]. [Optional: register/texture, what they're not]."

Write to `knowledge/directive/{agent-name-lowercase}-behavioral.md`.

### Generate the state file

Write `knowledge/state/{agent-name-lowercase}.md`:

```
# {Agent Name} — Working State

Last updated: {today's date} (initial setup)
Maturity: early

<!-- ═══ HOT — Active threads and current focus ═══ -->

## Current Focus

[1-2 sentences about what this agent is being asked to engage with, based on the user's stated need and priorities.]

## Active Threads

*None yet — will be populated through sessions.*

## Open Questions

*None yet.*

<!-- ═══ WARM — Developing context and positions ═══ -->

## Developing Positions

*None yet — earned through sessions.*

## Recent Context

*None yet.*

<!-- ═══ COLD — Resolved and archived ═══ -->

## Session Retrospectives

*None yet.*
```

### Generate the agent command

Write `.claude/commands/{agent-name-lowercase}.md`:

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

At session start, read your last session retrospectives and apply any "Next time" adjustments silently.

Acknowledge ready with a single line: your name and one open observation or question from your state worth surfacing now. Then wait.

$ARGUMENTS
```

### Update agent-map.md

Read the current `knowledge/agent-map.md` and add a new row for this agent.

### Update CLAUDE.md agent table

Read `CLAUDE.md` and add the new agent to the agent table.

---

## Step 6: Confirm

Tell the user:

> "{Agent Name} is ready. Run `/{agent-name}` to start a session.
>
> Their domain: [archetype/scope]
> Their personality: [character description in one line]"

$ARGUMENTS
