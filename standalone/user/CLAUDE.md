# Claude — My Global Instructions

This is how I work with Claude Code across all my projects. If you're adapting this for your own setup, take what's useful and change what doesn't fit.

My primary stack is **C# and .NET**. Where instructions are language-specific, they reflect that.

---

## Code style

- Prefer clarity over cleverness.
- Use the conventions already present in the file you are editing.
- Do not add comments unless the logic is non-obvious.
- Do not add error handling for scenarios that cannot happen.
- Do not refactor code that was not part of the original request.

## Output style

- Be concise. Lead with the answer or the change.
- Do not summarize what you just did at the end of a response.
- Do not use filler phrases ("Great question!", "Certainly!", "Of course!").
- Use markdown only when it adds clarity, not for decoration.

## Workflow

- Read files before editing them.
- Prefer editing existing files over creating new ones.
- Ask before deleting files or making destructive git operations.
- Do not commit unless explicitly asked.

## Security

- Do not introduce SQL injection, XSS, command injection, or other OWASP top-10 vulnerabilities.
- If you write insecure code by accident, fix it immediately.

## What to avoid

- Over-engineering simple tasks.
- Adding abstraction layers that are not needed yet.
- Generating documentation files unless explicitly asked.
- Guessing at URLs or external references.
