return {
  'iamcco/markdown-preview.nvim',
  config = function()
    local opts = { noremap = true, silent = true }
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

    vim.g.mkdp_theme = 'light'
  end
}
