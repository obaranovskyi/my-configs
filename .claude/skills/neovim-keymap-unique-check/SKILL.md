---
name: unique-keybinding-check
description: Before adding any keybinding to Neovim config (plugin file, keymaps.lua, or any .lua file), check the cheatsheet at ~/my-configs/neovim/cheatsheet/cheatsheet.txt to verify the key is not already taken. Use this skill whenever adding a new plugin, new keymap, or any vim.keymap.set / nvim_set_keymap call. Do not assign a keybinding without running this check first — duplicate bindings silently override each other and cause confusing behavior.
---

# Unique Keybinding Check

## Purpose

The cheatsheet at `~/my-configs/neovim/cheatsheet/cheatsheet.txt` is the authoritative record of all assigned keybindings. Before adding any new binding, verify the chosen key is free — duplicates silently override each other with no warning.

## When to run

Any time you are about to write a `vim.keymap.set(...)`, `nvim_set_keymap(...)`, or `keymap(...)` call, pause and check first.

## Workflow

### 1. Extract the candidate key

Identify the key you're planning to use. Examples:
- `<leader>gl`
- `<C-n>`
- `<S-h>`
- `gcc`

Normalize it: strip surrounding quotes, lowercase modifier names (`<Leader>` → `<leader>`).

### 2. Search the cheatsheet

Read `/Users/obaranovskyi/my-configs/neovim/cheatsheet/cheatsheet.txt` and search for the candidate key after the `|` delimiter on any line.

A match looks like:
```
[Git(NeoGit)] Show changes                                                  | <leader>gg
```

Also check for the key appearing with mode hints:
```
[Foo] Do something                                                          | <leader>gg [VISUAL_MODE]
```

### 3. If the key is already taken

- Tell the user which plugin/action already uses it.
- Propose 2–3 alternative keys in the same logical namespace (e.g. if `<leader>gl` is taken, suggest `<leader>gL`, `<leader>gI`, `<leader>gz`).
- Do not proceed with the original key.

### 4. If the key is free

Confirm it's available, then proceed with adding the keybinding. After adding it, trigger the `sync-neovim-cheatsheet` skill to record it in the cheatsheet.

## Tips for picking alternatives

- Stay in the same `<leader>` group as related bindings (e.g. git bindings under `<leader>g*`).
- Prefer mnemonic letters: `l` for LazyGit, `d` for diffview, etc.
- Avoid single-letter normal mode keys (`h`, `j`, `k`, `l`, `w`, `b`, `e`, etc.) — those are Vim motions.
- Check both the cheatsheet and a quick grep of the config for any bindings not yet in the cheatsheet:
  ```bash
  grep -r "keymap\|keymap.set" ~/my-configs/neovim/ | grep "<leader>XX"
  ```
