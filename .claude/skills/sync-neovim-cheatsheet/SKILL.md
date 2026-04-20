---
name: sync-neovim-cheatsheet
description: Syncs the Neovim cheatsheet at ~/my-configs/neovim/cheatsheet/cheatsheet.txt after Neovim config changes. Use this skill whenever a Neovim plugin is added, removed, or reconfigured, keybindings are added or changed in any plugin file or keymaps.lua, or the user asks to update/sync the cheatsheet. Trigger proactively after any edit to files under neovim/plugins/ or neovim/configs/keymaps.lua — don't wait to be asked.
---

# Sync Neovim Cheatsheet

## Purpose

Keep `~/my-configs/neovim/cheatsheet/cheatsheet.txt` accurate and up-to-date after any Neovim config change. The cheatsheet is the user's single source of truth for keybindings — it should reflect what's actually in the config, nothing more, nothing less.

## Paths

- **Cheatsheet**: `/Users/obaranovskyi/my-configs/neovim/cheatsheet/cheatsheet.txt`
- **Plugins**: `/Users/obaranovskyi/my-configs/neovim/plugins/` (recursive)
- **Keymaps**: `/Users/obaranovskyi/my-configs/neovim/configs/keymaps.lua`

## Workflow

### 1. Identify what changed

If the trigger was a specific file edit in this conversation, you already know what changed — use that directly. Otherwise, run:

```bash
git -C ~/my-configs diff HEAD~1 -- neovim/
```

Focus on:
- New `keymap(...)` or `vim.keymap.set(...)` calls
- Removed or commented-out keymaps
- Changed keys or commands

### 2. Read the relevant plugin file(s)

Read the changed plugin file(s) fully to extract all keybindings they define. Note:
- The key (e.g. `<leader>gl`)
- The command it runs
- The mode (n/v/i etc.)
- The plugin name (for the cheatsheet section header)

### 3. Read the cheatsheet

Read the full cheatsheet to find the relevant `@SectionName` block. Each section looks like:

```
## cheatsheet @Git
[Git(Plugin)] Description of action                                         | <leader>xy
```

### 4. Apply the diff

Make the minimum necessary changes:

| Situation | Action |
|-----------|--------|
| New keybinding added to config | Add a new line to the appropriate `@Section` |
| Keybinding removed from config | Remove its cheatsheet line |
| Key changed | Update the key in the existing line |
| New plugin with no section yet | Add a new `## cheatsheet @PluginName` section |

**Do not** reformat, reorder, or touch lines unrelated to the change.

### 5. Formatting rules

Cheatsheet lines must follow this exact format (pipe `|` aligned at column 77):

```
[SectionTag] Human-readable description of what it does                     | <key>
```

- Use the plugin's display name in the tag: `[Git(LazyGit)]`, `[Git(Neogit)]`, etc.
- Description should be action-oriented ("Open LazyGit", not "lazygit")
- Pad with spaces so `|` lands at column 77
- Append mode hints when non-obvious: `| <key> [VISUAL_MODE]`

## Example

After adding `lazygit.nvim` with `<leader>gl`:

**Add to `## cheatsheet @Git`:**
```
[Git(LazyGit)] Open LazyGit                                                 | <leader>gl
```

Place it logically — group by plugin, alphabetically within the group if unsure.
