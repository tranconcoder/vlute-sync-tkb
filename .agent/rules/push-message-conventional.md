---
description: Enforce Conventional Commits specification for commit messages
---

# Conventional Commits Rule

When creating commit messages, you MUST adhere to the [Conventional Commits specification (v1.0.0)](https://www.conventionalcommits.org/en/v1.0.0/).

## Commit Message Format
```text
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Allowed Types
- **feat**: A new feature (correlates with MINOR in Semantic Versioning).
- **fix**: A bug fix (correlates with PATCH in Semantic Versioning).
- **docs**: Documentation only changes.
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc).
- **refactor**: A code change that neither fixes a bug nor adds a feature.
- **perf**: A code change that improves performance.
- **test**: Adding missing tests or correcting existing tests.
- **build**: Changes that affect the build system or external dependencies.
- **ci**: Changes to CI configuration files and scripts.
- **chore**: Other changes that don't modify `src` or `test` files.
- **revert**: Reverts a previous commit.

## Important Rules
1.  **Description**: Use the imperative, present tense: "change" not "changed" nor "changes". Do not capitalize the first letter. No dot (.) at the end.
2.  **Scope**: A scope MAY be provided after a type indicating the section of the codebase, consisting of a noun, e.g., `feat(api): add user endpoint`.
3.  **Breaking Changes**: 
    -   A commit that has a footer starting with `BREAKING CHANGE:`, or appends a `!` after the type/scope (e.g., `feat!: ...` or `feat(api)!: ...`), introduces a breaking API change (correlating with MAJOR in SemVer). 
    -   A BREAKING CHANGE can be part of commits of any type.
4.  **Body**: The body is OPTIONAL. When used, it should include the motivation for the change and contrast this with previous behavior.
5.  **Footers**: Footers are OPTIONAL. Use them to reference issue trackers (e.g., `Closes #123`) or list co-authors.

## Examples
- `feat(auth): implement JWT login`
- `fix: resolve crash on user profile load`
- `docs(readme): update API usage examples`
- `feat!: drop support for Node 14`
- `refactor(db)!: change primary key to UUID`
