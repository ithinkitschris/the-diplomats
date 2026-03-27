Read `knowledge/agent-map.md` to get the current list of agents and their commands.

Then display the following reference card:

---

## Your System — Command Reference

### Your Agents

[Display as a table from agent-map.md: Agent Name | Archetype | Command]

### System Commands

| Command | What it does |
|---------|-------------|
| `/setup` | First-time setup — run once |
| `/{agent-name}` | Start a session with that agent |
| `/close` | End-of-session state update — run after every meaningful session |
| `/align` | State accuracy check — run when things have shifted |
| `/add-agent` | Add a new agent to your system |
| `/debrief` | Structured reflection on your experience |
| `/menu` | Show this reference card |

### How to Use

1. **Start a session:** run `/{agent-name}`. The agent loads your knowledge base and picks up from their last state.
2. **Work:** have the conversation you came to have.
3. **End a session:** run `/close`. Your agent writes what changed to their state file. Without this, the next session starts from scratch.
4. **Check accuracy:** run `/align` after a big shift — major decision, life change, or when sessions feel off.
5. **Grow:** run `/add-agent` when you want a second or third agent for a different domain.

### Your Knowledge Files

`knowledge/core/` and `knowledge/context/` — plain text, readable anytime. Edit directly or tell your agent to update during `/close`.

$ARGUMENTS
