return {
	"simeji/winresizer",
	config = function()
		vim.cmd([[
      let g:winresizer_start_key = '<leader>a'

      let g:winresizer_keycode_cancel = 122

      let g:winresizer_keycode_up = "\<UP>"
      let g:winresizer_keycode_down = "\<DOWN>"
    ]])

		vim.keymap.set("n", "<leader>a", ":silent! WinResizerStartResize<CR>", { silent = true })
	end,
}
