local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end


local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local source_mapping = {
  buffer = "[Buf]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[API]",
  cmp_tabnine = "[T9]",
  copilot = "[CO]",
  path = "[Path]",
  tmux = "[TX]",
  vsnip = "[VSNiP]",
  luasnip = "[LSNiP]",
}

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body)     -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-c>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Right>"] = cmp.mapping.confirm({ select = true }),

    -- Config-1 luaship (https://github.com/hrsh7th/nvim-cmp/issues/637)
    -- ["<Tab>"] = cmp.mapping(function(fallback)
    --   if luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
    --   end
    -- end, { "i", "s" }),
    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
    --   if luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { "i", "s" }),
    -- end of Config-1 luasnip


    -- Config-2 luaship
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      -- I was fixing the issue with check_backspace
      -- Right now works without it 
      --[[ elseif check_backspace() then ]]
      --[[   fallback() ]]
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    -- end of Config-1 luasnip
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp', max_item_count = 20 },
    { name = 'nvim_lua', max_item_count = 20 },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'buffer', keyword_length = 5, max_item_count = 10 }, -- buffer
    { name = 'path' }, -- path completion
  }, {
    { name = 'buffer' },
  }),

  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = "[Buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[API]",
        cmp_tabnine = "[T9]",
        copilot = "[CO]",
        path = "[Path]",
        tmux = "[TX]",
        vsnip = "[VSNiP]",
        luasnip = "[LSNiP]",
      })[entry.source.name]
      return vim_item
    end,

  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer', keyword_length = 3 },
    { name = 'nvim_lsp_document_symbol', keyword_length = 3 },
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline', max_item_count = 20, keyword_length = 2 }
  })
})
