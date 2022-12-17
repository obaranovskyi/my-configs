local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-s>", ":MarkdownPreview<CR>", opts)


vim.g.markdown_fenced_languages = {
  'html',
  'css',
  'scss',
  'python',
  'bash=sh',
  'sql',
  'javascript',
  'typescript',
  'lua'
}
