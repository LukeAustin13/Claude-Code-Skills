# Claude Code Overview

Claude Code is Anthropic's official CLI for Claude. It runs in your terminal and acts as an interactive coding assistant with full access to your local filesystem, shell, and tools.

---

## Key concepts

**Skills**
User-defined prompts stored in `.claude/skills/`. Each skill lives in its own folder with a `SKILL.md` that tells Claude what to do when that skill is invoked.

**Agents**
Subagent definitions stored in `.claude/agents/`. Each agent has a focused role and set of tools. Claude can spin up agents to handle specific tasks in parallel or in sequence.

**CLAUDE.md**
A special markdown file that Claude always reads at session start. Use it to set persistent rules, coding standards, and context for the current project or your global setup.

**settings.json**
Controls Claude Code behavior: allowed tools, model selection, hooks, MCP servers, and permissions. Lives at `~/.claude/settings.json` (user-level) or `.claude/settings.json` (project-level).

**Hooks**
Shell commands that run automatically in response to Claude Code events (e.g. before a tool call, after a response). Configured in `settings.json`.

---

## Where config files live

| Scope | Location |
|---|---|
| User-level CLAUDE.md | `~/.claude/CLAUDE.md` |
| User-level settings | `~/.claude/settings.json` |
| User-level skills | `~/.claude/skills/<skill-name>/SKILL.md` |
| User-level agents | `~/.claude/agents/<agent>.md` |
| Project-level CLAUDE.md | `<repo>/.claude/CLAUDE.md` |
| Project-level settings | `<repo>/.claude/settings.json` |

---

## Session flow

1. Claude reads all CLAUDE.md files (user-level first, then project-level).
2. Settings are merged (project overrides user where they conflict).
3. You interact via the prompt. Claude uses tools to read files, run commands, edit code.
4. Skills and agents are available throughout the session.
