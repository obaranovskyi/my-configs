---
name: gacp
description: Stage all changes, write a conventional commit message based on the diff, and push to the current remote branch.
argument-hint: "[optional commit message override]"
---

# /gacp

Git add, commit, and push in one step with an auto-generated conventional commit message.

## Usage

```
/gacp
/gacp $ARGUMENTS
```

## Steps

1. Run `git diff HEAD` and `git status` to understand all current changes.
2. If `$ARGUMENTS` is provided, use it as the commit message. Otherwise write a concise conventional commit message (`type(scope): summary`) derived from the diff — keep it under 72 characters.
3. Stage all modified and untracked files: `git add -A`.
4. Commit with the message.
5. Push to the current remote branch (`git push`). If no upstream is set, run `git push -u origin <branch>`.
6. Report the commit hash and message.

## Commit message rules

- Use conventional commits: `feat`, `fix`, `refactor`, `chore`, `docs`, `style`, `test`.
- Scope is optional but encouraged when changes are isolated to one area (e.g. `feat(zsh): ...`).
- Body is only added when the why is non-obvious.
- Never include "Co-Authored-By" unless the user asks.
