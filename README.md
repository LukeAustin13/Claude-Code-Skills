# Claude Code Skills

My personal Claude Code toolkit — skills, agents, and project templates I use across my work.

This is how I work. Feel free to fork it, adapt it, or use anything here as a starting point for your own setup.

---

## Stack focus

This toolkit is built around **C# and .NET**. The skills, agents, and project templates reflect that context. General-purpose skills (PR review, bug triage, planning, research) are stack-agnostic and work anywhere.

---

## What this repo is

A structured collection of:

- **Skills** — prompts that tell Claude how to handle a specific task (e.g. refactor C#, review a PR)
- **Agents** — subagent definitions with a focused role and working style
- **Project templates** — a minimal `.claude/` folder ready to drop into a new repo
- **Docs** — short reference material on how Claude Code works and how this repo is organized
- **Scripts** — helpers for installing assets to your local Claude setup

This is **not** a plugin system and has no runtime dependencies beyond Claude Code itself.

---

## Folder structure

```
claude-code-skills/
├─ LICENSE
├─ README.md
├─ docs/                          Reference docs and cheatsheets
├─ standalone/
│  ├─ user/                       Skills, agents, CLAUDE.md, and settings ready to install
│  └─ project-template/           Minimal .claude/ folder to copy into new repos
├─ scripts/                       Install and validation helpers
└─ examples/                      Filled-in examples of a skill, agent, and project setup
```

| Folder | Purpose |
|---|---|
| `docs/` | Claude Code overview, built-in commands, skills vs agents, conventions |
| `standalone/user/` | The main toolkit — install this into `~/.claude/` |
| `standalone/project-template/` | Copy this `.claude/` into any new project |
| `scripts/` | Symlink installer (Windows + Linux/Mac), skill validator |
| `examples/` | Reference examples showing what a complete skill, agent, and project looks like |

---

## Quick start

Run the install script to symlink everything into your local Claude setup:

**Windows (PowerShell):**
```powershell
.\scripts\install-user-symlinks.ps1
```

**Linux / Mac:**
```bash
bash scripts/install-user-symlinks.sh
```

This links `standalone/user/skills/`, `standalone/user/agents/`, `CLAUDE.md`, and `settings.json` into `~/.claude/` so Claude Code picks them up automatically. No elevation required — the script uses Junctions for folders and HardLinks for files on Windows.

---

## Skills

| Skill | What it does |
|---|---|
| `csharp-refactor` | Refactors C# code without changing behavior |
| `pr-review` | Reviews a pull request with blocking/suggestions/notes structure |
| `bug-triage` | Classifies and prioritizes a bug before investigation |
| `frontend-design` | Builds distinctive, production-grade frontend UI |
| `skill-creator` | Creates and iteratively improves new skills with evals |

---

## Agents

| Agent | Role |
|---|---|
| `csharp-reviewer` | Deep C# code review with .NET-specific checks |
| `code-reviewer` | Language-agnostic code review |
| `bug-investigator` | Traces a bug to its root cause |
| `front-end-designer` | Designs and implements UI components |
| `planner` | Breaks tasks into ordered implementation steps |
| `researcher` | Researches topics, APIs, and libraries with cited sources |
| `task-manager` | Tracks and prioritizes tasks within a session |
| `delegator` | Orchestrates subagents and integrates their results |

---

## How to add a new skill

1. Create a folder under `standalone/user/skills/` with a short hyphenated name.
2. Add a `SKILL.md` using this template:

```markdown
# Skill Name

## When to use
Describe the situation where this skill should be triggered.

## What to do
Describe what Claude should do when this skill runs.

## Constraints
List anything Claude should not do or should be careful about.

## Output style
Describe the expected format or tone of the output.
```

3. Re-run the install script to link it into `~/.claude/skills/`.

See `examples/sample-skill/SKILL.md` for a complete example.

---

## How to add a new agent

1. Create a `.md` file under `standalone/user/agents/` named by purpose (e.g. `sql-reviewer.md`).
2. Define role, strengths, what to avoid, and working style.
3. Re-run the install script to link it into `~/.claude/agents/`.

See `examples/sample-agent/agent.md` for a complete example.

---

## How to use the project template

1. Copy `standalone/project-template/.claude/` into the root of your target repo.
2. Fill in the `CLAUDE.md` with project-specific rules.
3. Add project-specific skills and agents to their folders as needed.

---

## Docs

| File | Contents |
|---|---|
| `docs/claude-code-overview.md` | What Claude Code is and how it works |
| `docs/built-in-commands-cheatsheet.md` | Slash commands and session controls |
| `docs/skills-vs-agents.md` | When to use a skill vs an agent |
| `docs/conventions.md` | Naming and structure conventions for this repo |
| `docs/how-to-add-and-use.md` | Step-by-step guide to adding and invoking skills and agents |

---

## Imported skills

Two skills in this repo were not written by me and have their own licenses:

- `standalone/user/skills/frontend-design/` — see `LICENSE.txt` inside that folder
- `standalone/user/skills/skill-creator/` — see `LICENSE.txt` inside that folder

Everything else in this repo is MIT licensed. See `LICENSE`.

---

## Rules I follow

- Keep it simple. No plugins.
- Every skill lives in its own folder with a `SKILL.md`.
- Agent files are named by purpose, one file per agent.
- Prefer a few high-value skills over many weak ones.
- Docs explain usage, not just raw information.
