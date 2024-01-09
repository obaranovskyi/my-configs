## Mappings

#### Run command mapping
```lua
vim.api.nvim_set_keymap('n', '<leader>nt', '<cmd>lua open_neotree_and_reveal()<CR>',
  { noremap = true, silent = true })
```

nvim_create_augroup — Create or get an augroup.
nvim_create_autocmd — Create an autocmd.
nvim_del_augroup_by_id — Delete an augroup by id.
nvim_del_augroup_by_name — Delete an augroup by name.
nvim_del_autocmd — Delete an autocmd by id.
nvim_do_autocmd — Do one autocmd.
nvim_get_autocmds — Get autocmds that match the requirements.

autocmd - https://www.youtube.com/watch?v=HR1dKKrOmDs