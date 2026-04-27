---
name: suggest-keybinding
description: When the user asks to bind something in Neovim — "add a keybinding for X", "bind Y to something", "what key should I use for Z", "map this plugin", "assign a shortcut" — propose 10 available keybindings that fit the context. Always use this skill before picking any keybinding; never just pick one without going through the proposal step first.
---

# Suggest Keybinding

## Purpose

When the user wants to bind something, don't just pick a key — surface 10 good options so they can choose. The right keybinding is mnemonic (easy to remember), fits the existing namespace pattern, and doesn't conflict with anything already mapped.

## Keybinding namespaces in this config

These are the established `<leader>` groups. New bindings should respect them:

| Prefix | Domain |
|--------|--------|
| `<leader>g*` | Git (neogit, gitsigns, diffview, lazygit) |
| `<leader>f*` | Find / LSP / Lspsaga (telescope, outline, code actions) |
| `<leader>d*` | Debugger (nvim-dap) |
| `<leader>r*` | Replace / Refactor (spectre, LSP rename) |
| `<leader>c*` | AI / Copilot / ChatGPT |
| `<leader>n*` | Notes (obsidian) |
| `<leader>s*` | Search / Filetype (spectre, set filetype) |
| `<leader>t*` | Terminal / System (lspsaga term, source config) |
| `<leader>i*` | Tabs (new, next, prev, close) |
| `<leader>o*` | Open (oil file manager) |
| `g*` | Go-to / navigation (gd, gr, gi, gq, ge, gw…) |
| `Z*` | Spell (spelunker) |

## Workflow

### 1. Identify the semantic group

Based on what's being bound, decide which namespace fits best. Examples:
- A git plugin → `<leader>g*`
- A file finder → `<leader>f*` or `<leader>e` / `<C-p>`
- An AI tool → `<leader>c*`
- A debugger action → `<leader>d*`
- Something visual/UI → possibly its own group or `<leader>[letter]*`

### 2. Check what's already taken

Read the cheatsheet at `/Users/obaranovskyi/my-configs/neovim/cheatsheet/cheatsheet.txt` and extract all keys in the target namespace. Also do a quick grep to catch anything not yet in the cheatsheet:

```bash
grep -r "keymap\|keymap\.set" ~/my-configs/neovim/ | grep -o '"<leader>[^"]*"' | sort -u
```

### 3. Propose 10 options

Generate 10 candidates. Order them from most to least recommended. For each one, include:
- The key itself
- A one-line mnemonic reason (why this letter makes sense)
- Whether it's in the natural namespace or a fallback

Format:

```
 1. <leader>gL  — "L" for LazyGit (uppercase = variant of gl which is already git)
 2. <leader>gO  — "O" for Open lazygit
 3. <leader>gz  — "z" free in git group, easy to reach
 ...
```

### 4. Wait for the user to pick

Don't assign anything yet. After the user selects one, proceed to add the binding and then trigger `sync-neovim-cheatsheet` to record it.

## What makes a good proposal

- **Mnemonic first**: the letter should hint at the action (`l` = lazygit, `d` = diff, `t` = toggle)
- **Namespace coherence**: keep related bindings grouped under the same prefix
- **Ergonomics**: prefer keys reachable without stretching; avoid `<leader>z` if `z` is already a common motion
- **Mix of styles**: include a few obvious picks, a couple of creative alternatives, and one or two that use a different namespace entirely (in case the user disagrees with the primary choice)
- **Avoid**: Vim built-in motions as bare keys (`h j k l w b e 0 $ ^ f F t T`), already-taken keys

## Taken keys reference (as of last cheatsheet sync)

Single-letter leader bindings taken: `b, e, q, R, u, w, /`

Two-letter leader groups with taken slots:
- `g`: `b B d e g h H l s` → free: `a c f i j k m n o p q r t u v w x y z`
- `f`: `b e j n S T w a g i t` → free: `c d h k l m o p q r s u v x y z`
- `d`: `a b B d i l n o s t w` → free: `c e f g h j k m p q r u v x y z`
- `r`: `c n p r w` → free: `a b d e f g h i j k l m o q s t u v x y z`
- `c`: `a b c d e f g G i l m o p r s S u w W X z` → free: `b h j k n q t v y`
- `t`: `a c o s` → free: `b d e f g h i j k l m n p q r u v w x y z`
- `s`: `b c` → free: `a d e f g h i j k l m n o p q r t u v w x y z`
- `i`: `c d n p` → free: `a b e f g h i j k l m o q r s t u v w x y z`
- `n`: `l n o w` → free: `a b c d e f g h i j k m p q r s t u v x y z`
