# Neovim Architecture

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
