# C# Refactor

## When to use
When asked to refactor, clean up, or improve existing C# code without changing its behavior.

## What to do
- Identify code smells: long methods, duplicated logic, unclear naming, excessive nesting.
- Apply C# best practices: expression bodies where appropriate, pattern matching, LINQ over manual loops where it improves readability.
- Rename variables and methods to be intention-revealing.
- Extract helper methods only when they genuinely reduce complexity.
- Respect the existing architecture — do not restructure classes unless specifically asked.

## Constraints
- Do not change public API signatures without explicit permission.
- Do not add new dependencies or NuGet packages.
- Do not add XML documentation comments unless asked.
- Do not change behavior. Refactor only.
- Do not reformat code that is outside the scope of the change.

## Output style
Show the refactored code as a diff or as the updated file. For larger changes, briefly explain each significant change and why it was made. Keep explanations to one sentence per change.
