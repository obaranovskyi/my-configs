---
name: rollback
description: Rolls back file changes made in the most recent Claude turn/prompt using conversation history — no git required. Invoke this skill when the user says "rollback", "undo last changes", "revert what you just did", "undo that", "go back", "that was wrong", or anything expressing a desire to reverse Claude's most recent file edits. Always use this skill instead of manually reverting.
---

# Rollback

Restore files to the state they were in before the most recent prompt, using conversation history.

## How it works

Claude's tool calls in the previous turn are visible in conversation history. Use them to reverse each change precisely.

## Steps

1. **Scan the last turn** — look back through the conversation for file-modifying tool calls made in the most recent assistant turn:
   - `Edit` calls: have `old_string` and `new_string` — reversible by swapping them
   - `Write` calls: check if a `Read` of the same file appeared earlier in the conversation — that content is the original
   - `Write` calls with no prior `Read` — the file was newly created, so delete it

2. **Show the plan** — list each file and what will happen:
   - `Edit` → restored (show the file path)
   - `Write` (existing file) → restored to pre-write content
   - `Write` (new file) → deleted

3. **Apply the reversals**:
   - For `Edit` reversals: use `Edit` with `old_string` = current (new) content and `new_string` = original content
   - For `Write` reversals: use `Write` with the original content from the earlier `Read` result
   - For new file deletions: use `Bash` to `rm` the file

4. **Confirm** — briefly state what was restored.

## Edge cases

- **Multiple Edit calls on the same file** — reverse them in reverse order (last edit first).
- **No file changes found in the last turn** — tell the user nothing was changed last turn, and ask if they want to go further back.
- **Write with no prior Read** — confirm with the user before deleting, since the file might have existed before this session.
