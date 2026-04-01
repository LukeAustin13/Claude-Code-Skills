# How to Add and Use Skills and Agents

A practical guide for extending this toolkit and using it in a live Claude Code session.

---

## Adding a new skill

1. Create a folder under `standalone/user/skills/` with a short hyphenated name:

   ```
   standalone/user/skills/your-skill-name/
   ```

2. Create a `SKILL.md` inside it:

   ```markdown
   # Skill Name

   ## When to use
   Describe the situation that triggers this skill.

   ## What to do
   What Claude should do when this skill is invoked.

   ## Constraints
   What Claude should avoid or be careful about.

   ## Output style
   Expected format, length, and tone of the output.
   ```

3. Copy or symlink the skill into your Claude user skills folder:

   ```
   ~/.claude/skills/your-skill-name/SKILL.md
   ```

   Or run `scripts/install-user-symlinks.ps1` (Windows) / `scripts/install-user-symlinks.sh` (Linux/Mac) to do this automatically.

4. Open a new Claude Code session. The skill is now available.

---

## Adding a new agent

1. Create a `.md` file under `standalone/user/agents/`:

   ```
   standalone/user/agents/your-agent-name.md
   ```

2. Fill it in using this structure:

   ```markdown
   # Agent Name

   ## Role
   What this agent is responsible for.

   ## Strengths
   What it does well.

   ## Avoid
   What it should not do.

   ## Working style
   Tone, format, and approach.
   ```

3. Copy or symlink it into:

   ```
   ~/.claude/agents/your-agent-name.md
   ```

4. Open or continue a Claude Code session. Ask Claude to use the agent by name.

---

## Using a skill in a session

Skills are invoked with a slash command matching the skill folder name:

```
/csharp-refactor
/pr-review
/bug-triage
```

Type this at the Claude Code prompt. Claude will read the `SKILL.md` and follow its instructions for the current task.

You can also refer to a skill by name in natural language:

```
Use the pr-review skill on the current branch.
```

---

## Using an agent in a session

Agents are not invoked by slash command. You ask Claude to use one:

```
Use the csharp-reviewer agent to review src/Services/OrderService.cs.
```

Or Claude may choose to spin up an agent automatically when the task fits.

---

## Checking what skills and agents are available

Ask Claude directly:

```
What skills and agents do I have available?
```

Or check the folders:

```
ls ~/.claude/skills/
ls ~/.claude/agents/
```

---

## Installing assets from this repo to your local Claude setup

Run the appropriate install script from the `scripts/` folder:

- **Windows:** `scripts/install-user-symlinks.ps1`
- **Linux/Mac:** `scripts/install-user-symlinks.sh`

These scripts create symlinks from `~/.claude/skills/` and `~/.claude/agents/` to the files in this repo, so changes here are reflected immediately.

---

## Updating a skill or agent

Edit the `SKILL.md` or agent `.md` file directly in this repo. If you used symlinks, the change is live immediately in your next session. If you copied files, re-run the install script.
