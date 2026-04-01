# Claude — Sample Project

This is an example project-level CLAUDE.md. Replace the contents with rules specific to your project.

---

## Project context

A sample web API built with ASP.NET Core. Provides CRUD endpoints for a simple task management domain.

## Coding standards

- Follow existing naming conventions in each file.
- All service methods are async. Use `ConfigureAwait(false)` in library code.
- Validation happens at the controller layer using FluentValidation.
- No raw SQL. Use the repository pattern.

## Workflow rules

- Run `dotnet test` before marking any task complete.
- Do not push directly to main.
- Ask before adding NuGet packages.

## Key files and folders

- `src/Api/` — controllers and middleware
- `src/Core/` — domain models and interfaces
- `src/Infrastructure/` — database and external service implementations
- `tests/` — xUnit test projects

## Review expectations

- Check for missing validation on controller inputs.
- Check that async methods are not blocked synchronously.
- Check that new endpoints have corresponding tests.
