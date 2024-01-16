## Mappings


### Autocmd example
```lua
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

function neotree_auto_focus_in_tree()
  local buffer_name = vim.api.nvim_buf_get_name(0)
  local do_not_open = false

  local buffer_list = vim.api.nvim_list_bufs()
  for _, buf in ipairs(buffer_list) do
    local buf_name = vim.api.nvim_buf_get_name(buf)
    local buf_exclude_list = { 'diffview', 'spectre', 'OUTLINE'}
    for _, buf_to_exclude in ipairs(buf_exclude_list) do
      if string.find(buf_name, buf_to_exclude) then
        do_not_open = true
      end
    end
  end

  if buffer_name ~= nil and
     buffer_name ~= '' and
     not do_not_open
  then
    vim.cmd(':Neotree reveal')
    vim.cmd('wincmd h')
  end
end

local neoTreeAutoOpen = vim.api.nvim_create_augroup("NeoTreeAutoOpen", { clear = true })
-- To just open and not jump use 'BufRead'
vim.api.nvim_create_autocmd("BufWinEnter", {
  command = 'lua neotree_auto_focus_in_tree()',
  group = neoTreeAutoOpen
})
```

autocmd - https://www.youtube.com/watch?v=HR1dKKrOmDs

### Keymap
```lua
local opts = { noremap = true, silent = true }
local opt_nr = { noremap = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
```

or

```lua
vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
```

### Spectre plugin regex examples
```
SEARCH
\[([FB]{1}E)\]
REPLACE:
[is \1]

planning.tasks.md


┌──────────────────────────────────────────────────────
 planning.tasks.md:1:1:
│  [is FE][Finance] Add page with general elements
│  [is BE][Finance] Prepare general API request ???
│  [is FE][Finance] Principal balances grid
│  [is BE][Finance] Principal balances grid data
└──────────────────────────────────────────────────────
```
