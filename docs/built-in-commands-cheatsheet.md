# Built-in Commands Cheatsheet

Commands available during a Claude Code session. Type them at the prompt.

---

## General

| Command | What it does |
|---|---|
| `/help` | Show available commands |
| `/clear` | Clear the conversation context |
| `/compact` | Summarize conversation to save context space |
| `/model` | Switch the active model |
| `/fast` | Toggle fast mode (same model, faster output) |
| `/cost` | Show token usage and cost for the session |

## Config and setup

| Command | What it does |
|---|---|
| `/config` | Open the Claude Code config editor |
| `/permissions` | View and manage tool permissions |
| `/mcp` | Manage MCP server connections |

## Memory and context

| Command | What it does |
|---|---|
| `/memory` | View or edit persistent memory |

## Session control

| Command | What it does |
|---|---|
| `!<command>` | Run a shell command directly (e.g. `! git status`) |
| `Ctrl+C` | Interrupt the current operation |
| `Ctrl+D` or `/exit` | Exit Claude Code |

## Skills (user-defined)

| Syntax | What it does |
|---|---|
| `/<skill-name>` | Invoke a skill by its folder name |

---

## Notes

- Skills defined in `.claude/skills/<skill-name>/` are invoked as `/<skill-name>`.
- Agents are not invoked by slash command — Claude decides when to use them, or you can ask Claude to use a specific agent by name.
- Use `/compact` when a long session is losing coherence — it frees up context without losing continuity.
