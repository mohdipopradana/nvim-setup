return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		local opt = vim.opt
		opt.termguicolors = true
		require("colorizer").setup({
			"*",
		})
	end,
}
