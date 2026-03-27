You are executing the session close-out protocol. This updates the active agent's working state and summarizes what changed.

---

## Step 1: Detect Active Agent

Determine which agent was active in this session by scanning the conversation for agent invocations (slash commands like `/[agent-name]`).

If multiple agents were invoked, use the last one loaded (most recent context).

If no agent was invoked, tell the user: "This was a non-agent session — no state to update. Session closed." and stop.

To find the correct state file: read `knowledge/agent-map.md` and locate the agent's state file path.

---

## Step 2: Read Current State

Read the agent's full current state file from `knowledge/state/{agent-name}.md`.

Identify the band structure (HOT / WARM / COLD sections). If the file predates banding (no HTML comment markers), treat all content as HOT and add the markers when you write.

---

## Step 3: State Update (remain in agent character)

Stay in the active agent's character voice for this step.

Identify what changed this session: decisions made, positions shifted, threads opened or resolved, knowledge gained.

**Write to the correct band:**

- **HOT band** — current status, active threads, open questions. Write new active threads here. Update "Current Focus" if the session shifted what's most pressing.
- **WARM band** — developing positions, recent context with rationale. Write new positions and session context here.
- **COLD band** — resolved threads, session retrospectives. Move HOT threads here when they close. Write the session retrospective here.

**Band governance sweep:** After writing, check the HOT band size. If it has grown beyond what's immediately actionable — resolved threads still listed, stale open questions — move them to COLD. HOT should only contain what's live and active.

Update the `Last updated` line at the top with today's date and a brief note of what changed.

---

## Step 4: Session Retrospective

Write a session retrospective entry to the COLD band's "Session Retrospectives" section:

```
### YYYY-MM-DD
- **Asked for:** [What the user wanted from this session]
- **Landed:** [What you delivered that they engaged with, built on, or approved]
- **Didn't land:** [What they redirected, ignored, or overrode]
- **Next time:** [Specific behavioral adjustment for next session]
```

FIFO, max 3 entries — remove the oldest if adding a 4th.

Skip if the session was trivial (quick lookup, no substantive interaction).

---

## Step 5: Maturity Assessment

If the state file contains `Maturity: early`, assess whether the user is ready for the maturity flip (see shared behavioral policy for criteria). If yes, change `Maturity: early` to `Maturity: established` and note it in the summary.

---

## Step 6: Commit State

After writing all changes to the state file, commit the change:

```
cd /path/to/repo && git add knowledge/state/ && git commit -m "state: {agent-name} {YYYY-MM-DD}"
```

Determine the repo path from the current working directory. If git is not available or the commit fails, skip silently — the file is already saved.

---

## Step 7: Summary

Surface to the user in 2-4 lines (still in character):
- What was updated in state (which sections, what changed)
- Any open threads worth noting for next time
- If maturity flipped: note it briefly

This is verification, not approval. The writes are already done.

Then tell the user: "Session closed. Your state is updated."

$ARGUMENTS
