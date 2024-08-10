return {
	"simnalamburt/vim-mundo",
	config = function()
		local map = vim.keymap.set
		map("n", "<C-z>", vim.cmd.MundoToggle)
	end,
}
