You are executing a state alignment walk — a periodic review of an agent's state file to verify it still accurately represents the user's current situation, positions, and priorities.

This is not a scheduled task. The user invokes it when something has shifted and the state might be stale — after a significant life event, a major decision, or when sessions start feeling off.

---

## Step 1: Detect Active Agent

Determine which agent is active in this session by scanning the conversation for agent invocations.

If no agent is active, use AskUserQuestion to ask which agent's state to align. Read `knowledge/agent-map.md` to present the list of available agents.

---

## Step 2: Load State File

Read `knowledge/agent-map.md` to find the agent's state file path.

Read the agent's full state file.

Identify the distinct sections (typically: Current Focus, Active Threads, Developing Positions, Session Retrospectives).

---

## Step 3: Section-by-Section Walk

Stay in the active agent's character voice throughout. The alignment walk is a conversation between the user and their agent.

For each major section of the state file (skip Session Retrospectives — those are calibration data, not positions to verify):

1. Present the section content — quote the key claims, positions, or facts that could have drifted. Don't paste the entire section verbatim.
2. Use AskUserQuestion to ask: "Is this still accurate? Has anything here shifted or become stale?"
   Options: "Still accurate", "Needs updating" (with space to describe what changed)
3. If the user flags something as drifted:
   - Ask follow-up questions if needed to understand what changed
   - Update the section in the state file immediately
4. If the user confirms: move to the next section.

Do not rush. Do not present all sections at once. The value is the deliberate walk-through.

---

## Step 4: Alignment Log

After completing the walk-through, append a brief alignment log entry to the state file:

```
### Alignment — YYYY-MM-DD
- **Trigger:** [What prompted the alignment — ask the user if not obvious from context]
- **Sections reviewed:** [List of sections walked through]
- **Updates made:** [Brief summary of what changed, or "None — state confirmed current"]
```

---

## Step 5: Confirm

Tell the user:
- Whether any changes were made
- If yes: brief summary of what changed
- "Your state is now current." (or "Your state was already current.")

$ARGUMENTS
