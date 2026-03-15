You are executing the session close-out protocol. This updates the active agent's working state and summarizes what changed.

---

## Step 1: Detect Active Agent

Determine which agent was active in this session by scanning the conversation for agent invocations (slash commands like `/[agent-name]`).

If multiple agents were invoked, use the last one loaded (most recent context).

If no agent was invoked, tell the user: "This was a non-agent session — no state to update. Session closed." and stop.

To find the correct state file: read `knowledge/agent-map.md` and locate the agent's state file path.

---

## Step 2: State Update (remain in agent character)

Stay in the active agent's character voice for this step.

1. Read the agent's current state file from `knowledge/state/{agent-name}.md`
2. Identify what changed this session: decisions made, positions shifted, threads opened or resolved, knowledge gained
3. Write updates directly to the state file. Do not propose. Do not ask for approval.
4. Update the `Last updated` line at the top of the state file with today's date and a brief note of what changed.
5. Write a session retrospective entry to the "Session Retrospectives" section:
   - Use the format defined in the shared behavioral policy
   - FIFO, max 3 entries — remove the oldest if adding a 4th
   - Skip if the session was trivial (quick lookup, no substantive interaction)

---

## Step 3: Summary

Surface to the user in 2-4 lines (still in character):
- What was updated in state (which sections, what changed)
- Any open threads worth noting for next time

This is verification, not approval. The writes are already done.

Then tell the user: "Session closed. Your state is updated."

$ARGUMENTS
