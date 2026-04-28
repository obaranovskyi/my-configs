---
name: claude-rules-update
description: >
  Reviews recent project changes and updates the Claude rule files in .claude/rules/ to
  keep them accurate and current. Use this skill whenever you've added a plugin, changed
  a config structure, added a new tool or directory, moved files around, added new skills,
  or made any other structural change to the repo that Claude should know about going forward.
  Also invoke it when the user says something like "update the rules", "sync the rules",
  "the rules are outdated", or "remember this for future sessions". Run proactively after
  significant refactors or additions — don't wait to be asked.
---

# update-claude-rules

Keeps the Claude rule files in `.claude/rules/` in sync with the actual state of the repo.
These rules are always loaded into Claude's context, so stale rules cause confusion and
wrong suggestions. The goal is surgical, accurate edits — not rewriting everything.

## Rule files and what they cover

| File | Covers |
|---|---|
| `repository-purpose.md` | Repo overview, how tools are sourced/symlinked, exceptions |
| `neovim-architecture.md` | Plugin layout, config modules, cheatsheet, entry point |
| `tmux-architecture.md` | tmux.conf structure, plugins, sourced files |
| `zsh-architecture.md` | .zshrc, Oh My Zsh plugins, aliases, FZF |
| `python-utilities.md` | Python CLI tools, PATH setup, dependencies |
| `key-skills.md` | Skills to invoke for common tasks in this repo |

## Step 1 — Understand what changed

Run these to build a picture of recent changes:

```bash
git diff HEAD~1 HEAD --stat          # files changed in last commit
git diff HEAD~1 HEAD                 # full diff
git status                           # any uncommitted changes
```

If the user described what changed verbally, use that as the primary signal and use git to fill in details.

Also scan for structural facts relevant to the rules:

```bash
ls neovim/plugins/                   # plugin directories and standalone plugins
ls neovim/plugins/ai/ neovim/plugins/code/ neovim/plugins/ui/  # subdirectory contents
ls neovim/configs/                   # config modules
ls zsh/custom-aliases/               # alias files
ls python/                           # python utilities
ls tmux/                             # tmux config files
```

## Step 2 — Map changes to rule files

Use this mapping to decide which rule files need edits:

- New/removed Neovim plugin or config module → `neovim-architecture.md`
- New/removed plugin directory or subdirectory → `neovim-architecture.md`
- New/removed tmux config file or plugin → `tmux-architecture.md`
- New/removed zsh plugin, alias file, or FZF change → `zsh-architecture.md`
- New/removed Python CLI tool or PATH change → `python-utilities.md`
- New/removed top-level directory or sourcing pattern → `repository-purpose.md`
- New/removed/renamed skill → `key-skills.md`

When in doubt, read the current rule file and compare it against what `ls` and `git diff` show. If a rule file mentions something that no longer exists, or omits something that now exists, it needs updating.

## Step 3 — Edit only what needs changing

Make minimal, targeted edits. Don't rewrite sections that are still accurate.

- For additions: add a line or entry in the relevant section
- For removals: delete the stale line
- For renames/moves: update the path or name in place
- For new skills: add an entry to `key-skills.md` following the existing format

After editing, re-read the updated rule file to verify it reads naturally and is internally consistent.

## Step 4 — Report what you changed

Tell the user which files you edited and what specifically changed. One line per file is enough:

```
Updated neovim-architecture.md: added `harpoon` to the navigation/ subdirectory list.
Updated key-skills.md: added entry for `update-claude-rules`.
```

If nothing needed updating, say so explicitly: "Rule files are already up to date."

## What NOT to do

- Don't add commentary, rationale, or prose that describes *why* a change was made — rules are factual snapshots, not changelogs.
- Don't touch rule files that weren't affected by the change.
- Don't duplicate information across rule files — each file owns its domain.
- Don't add speculative or future-tense content ("this will be used for...").
