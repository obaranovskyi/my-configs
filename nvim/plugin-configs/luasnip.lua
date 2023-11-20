local ls = require("luasnip")

require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/my-configs/nvim/snippets/" } })

vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })






-- ISSUE FIX: always use tab to expand the text 
-- https://www.reddit.com/r/neovim/comments/15ptyvb/nvim_cmp_super_tab_goes_crazy/
local unlink_group = vim.api.nvim_create_augroup('UnlinkSnippet', { })
vim.api.nvim_create_autocmd('ModeChanged', {
   group = unlink_group,
   -- when going from select mode to normal and when leaving insert mode
   pattern = { 's:n', 'i:*' },
   callback = function(event)
     if
       ls.session
       and ls.session.current_nodes[event.buf]
       and not ls.session.jump_active
     then
       ls.unlink_current()
     end
   end,
})
