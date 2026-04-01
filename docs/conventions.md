# Conventions

Naming and structure rules for this repo.

---

## Naming

Use short, lowercase names with hyphens. No spaces, no underscores, no camelCase.

Good:
- `csharp-refactor`
- `pr-review`
- `bug-triage`
- `csharp-reviewer`
- `sql-analyzer`

Avoid:
- `helper`, `general`, `misc` — too vague
- `mySkill`, `my_skill` — wrong casing
- `skill-for-reviewing-pull-requests-in-dotnet` — too long

**Rule:** the name should tell you exactly what the skill or agent does in 1-3 words.

---

## Skill folder structure

Every skill must follow this layout:

```
skills/
└─ skill-name/
   └─ SKILL.md
```

Optional supporting files (examples, templates) can be added alongside `SKILL.md` if needed. Do not add them speculatively.

---

## Agent file structure

One file per agent. No subfolders needed.

```
agents/
└─ agent-name.md
```

The file name should match the agent's role. `csharp-reviewer.md` not `reviewer.md`.

---

## CLAUDE.md rules

- One CLAUDE.md per scope (user-level, project-level).
- Keep it short. Bullet points over paragraphs.
- Do not paste in long documentation or full policies.
- Only include rules that actively change how Claude behaves.

---

## Versioning and changes

- This repo uses git. Commit when you add or update a skill or agent.
- Do not delete skills without checking if they are in use.
- Prefer editing an existing skill over creating a new one if the use case overlaps.

---

## File encoding

All files are UTF-8. All line endings are LF (Unix-style), even on Windows. Configure your editor accordingly.
