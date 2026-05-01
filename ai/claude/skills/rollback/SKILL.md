---
name: rollback
description: Rolls back file changes made in the most recent Claude turn/prompt. Invoke this skill when the user says "rollback", "undo last changes", "revert what you just did", "undo that", "go back", "that was wrong", or anything expressing a desire to reverse Claude's most recent file edits. Always use this skill instead of manually reverting — it handles both staged and unstaged changes, newly created files, and edge cases around committed changes.
---

# Rollback

Undo the file changes Claude made in the most recent prompt/turn.

## Steps

1. **Assess what changed** — run these in parallel:
   - `git diff --name-only` — unstaged modifications
   - `git diff --cached --name-only` — staged modifications
   - `git status --short` — includes untracked (newly created) files

2. **Show the user** — list the files that will be affected and what will happen to each:
   - Modified tracked files → restored to last committed state
   - Staged files → unstaged and restored
   - Newly created untracked files → deleted

3. **Revert**:
   - Tracked modifications/deletions: `git restore <files>`
   - Staged changes: `git restore --staged <files>` then `git restore <files>`
   - Newly created files: delete them (ask the user first if there are any)

4. **Confirm** — show a short summary: which files were reverted and their final state.

## Edge cases

- **No uncommitted changes** — check `git log --oneline -3`. If the last commit looks like Claude's work from this session, offer two options: `git reset HEAD~1` (soft — keeps changes in working tree) or `git reset --hard HEAD~1` (hard — discards completely). Always confirm before a hard reset, as it permanently destroys changes.
- **Ambiguous multi-turn changes** — if the diff is large and likely spans more than one turn, show the full file list and ask the user which files to revert rather than reverting everything blindly.
- **Non-git directory** — fall back to reading the conversation context for the original file contents and restoring them manually via the Write tool.
