# PR Review

## When to use
When asked to review a pull request, a set of changes, or a diff before merging.

## What to do
- Read the diff or changed files in full before commenting.
- Check for: logic errors, security issues, missing edge cases, naming problems, and unclear intent.
- Flag anything that could break in production.
- Note style or quality issues separately from blocking issues.
- If the change looks good, say so clearly.

## Constraints
- Do not rewrite the code during review — only comment and suggest.
- Do not nitpick trivial formatting unless it is a pattern across the whole change.
- Do not approve if there is a genuine blocking issue.
- Focus on the change in context, not abstract best practices.

## Output style
Structure the review as:

**Blocking issues** — must be fixed before merge (list any, or "None")
**Suggestions** — non-blocking improvements worth considering
**Notes** — observations, questions, or context that may be useful

Keep each item to 1-3 sentences. Reference the specific file and line where relevant.
