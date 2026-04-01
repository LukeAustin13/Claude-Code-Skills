# Skills vs Agents

These are two different tools. Understanding the difference helps you decide what to build.

---

## Skills

A skill is a prompt template. It tells Claude what to do when invoked with a slash command.

- Stored in `.claude/skills/<name>/SKILL.md`
- Invoked by typing `/<name>` in a session
- Runs in the same Claude session — no subprocess, no separate tool access
- Good for: repeatable tasks that need consistent framing (refactor, review, triage)

**When to use a skill:**
- You want a consistent starting prompt for a task you do often
- The task does not need parallel execution or isolated context
- You want `/something` to just work

---

## Agents

An agent is a subagent with a defined role and a restricted tool set. Claude can spin one up to handle a focused task.

- Stored in `.claude/agents/<name>.md`
- Launched by Claude when appropriate, or by asking Claude to use a specific agent
- Runs as a subprocess with its own context and tool access
- Good for: isolated work that benefits from a focused role (code review, bug investigation, research)

**When to use an agent:**
- The task is complex enough to benefit from a focused, isolated execution
- You want parallel work (e.g. one agent reviews, another writes tests)
- The task has a clear start/end with a defined deliverable

---

## Quick comparison

| | Skill | Agent |
|---|---|---|
| Stored as | `SKILL.md` in a folder | Single `.md` file |
| Invoked by | `/skill-name` slash command | Claude decides, or you ask |
| Runs in | Main session | Subprocess (isolated) |
| Has own tools | No | Yes (defined in agent file) |
| Best for | Repeatable prompts | Focused, isolated tasks |

---

## Rule of thumb

If you can do it with a well-framed prompt, make it a skill.
If it benefits from isolation, parallel execution, or a restricted tool set, make it an agent.
