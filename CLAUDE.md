# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

Personal developer environment configuration ("dotfiles") repo. Clone into `~/my-configs/`. Each tool's config is sourced or symlinked from its standard location — nothing is copied in place.

## Integration Pattern

Each tool sources from this repo rather than owning its config directly:

```bash
# ~/.config/nvim/init.lua
package.path = "/Users/obaranovskyi/my-configs/nvim/?.lua;" .. package.path
require "init"

# ~/.tmux.conf
source ~/my-configs/tmux/tmux.conf

# ~/.zshrc
source /Users/obaranovskyi/my-configs/zsh/.zshrc
```

Ranger is an exception — its config is copied: `cat ~/my-configs/ranger/rc.conf > ~/.config/ranger/rc.conf`

## Neovim Architecture

Entry point: `neovim/init.lua` — loads configs then calls `lazy.setup()`.

**Config modules** (`neovim/configs/`): `lazy.lua`, `leader.lua`, `keymaps.lua`, `options.lua`, `theme.lua`, `search.lua`, `registers.lua`, `prompts.lua` (AI), `cyrillic-keymaps.lua`.

**Plugin layout** — all under `neovim/plugins/` with subdirectories by concern:
- `ai/` — copilot, copilot-chat, chatgpt
- `code/` — conform (formatting), dap (debugging), lspsaga, oil, autopairs, etc.
- `code/lsp/` — mason (LSP installer), cmp (completion), luasnip, treesitter
- `git/` — lazygit, gitsigns, diffview, neogit
- `ui/` — lualine, noice, which-key, dashboard, window-picker, themes/
- `telescope/` — fuzzy finder + extensions
- `navigation/` — leap, flit
- `notes/`, `quickfix/`

Top-level `neovim/plugins/` also contains standalone plugins (nvim-tree, marks, yanky, spectre, undotree, etc.).

Lazy.nvim auto-discovers plugin specs via `{ import = "plugins" }` and each subdirectory import in `init.lua`.

**Cheatsheet:** `neovim/cheatsheet/cheatsheet.txt` — maintained alongside keybinding changes. The `sync-neovim-cheatsheet` and `unique-keybinding-check` skills keep it in sync.

## Tmux Architecture

Entry point: `tmux/tmux.conf` — sources `configs.conf`, `keymaps.conf`, `vi-mode-keymaps.conf`, `integrations.conf`, `styles.conf`, `plugins.conf`. Uses TPM + vim-tmux-navigator.

## Zsh Architecture

`zsh/.zshrc` — Oh My Zsh with plugins: git, macos, web-search, sudo, z, dirhistory, colored-man-pages. Auto-downloads zsh-syntax-highlighting and zsh-autosuggestions on first run. Custom aliases in `zsh/custom-aliases/`. FZF config in `zsh/scripts/fzf.sh`.

## Python Utilities

`python/` contains standalone CLI tools (youtube-downloader, english-assist, read-tracker, clipboard-tracker, etc.). Install dependencies: `pip install -r requirements.txt`. The zsh config adds `python/` to PATH.

## Key Skills for This Repo

- **`sync-neovim-cheatsheet`** — run after any plugin add/remove or keybinding change
- **`unique-keybinding-check`** — run before assigning any new Neovim keybinding
- **`suggest-keybinding`** — use when choosing a key for a new binding
- **`gacp`** — git add/commit/push workflow
