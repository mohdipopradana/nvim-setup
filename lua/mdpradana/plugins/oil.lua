return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup({
			default_file_explorer = true,
			delete_to_trash = true,
		})
		local map = vim.keymap.set
		map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
