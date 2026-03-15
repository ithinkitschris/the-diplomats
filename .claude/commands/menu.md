Read `knowledge/agent-map.md` to get the current list of agents and their commands.

Then display the following reference card to the user:

---

## Your System — Command Reference

### Your Agents

[Display as a table from agent-map.md: Agent Name | Role | Command]

### System Commands

| Command | What it does |
|---------|-------------|
| `/setup` | First-time setup — run once to build your PKG and agents |
| `/close` | End-of-session state update — run after any meaningful session |
| `/align` | State accuracy check — run when things have shifted |
| `/debrief` | Structured reflection interview — for researcher-requested debriefs |
| `/menu` | Show this reference card |

### How to Use

1. **Start a session:** invoke an agent with its command (e.g. `/[agent-name]`). The agent loads your PKG and its state, acknowledges ready, and waits for you.
2. **Work:** have the conversation you came to have.
3. **End a session:** run `/close`. Your agent updates its working state and summarizes what changed.
4. **Check state accuracy:** run `/align` at any inflection point when things have shifted.

### Editing Your Knowledge

Your knowledge files live in `knowledge/core/` and `knowledge/context/`. They are plain text. Read them anytime. If something is factually wrong, you can edit the file directly — or tell your agent and they'll update it during `/close`.

$ARGUMENTS
