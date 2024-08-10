return {
	"akinsho/toggleterm.nvim",

	config = function()
		-- local map = vim.keymap.set

		local terminal = require("toggleterm")
		terminal.setup({
			open_mapping = [[<C-\>]],
			shading_factor = 2,
			direction = "float",
			size = 20,
			float_opts = {
				width = 130,
				height = 30,
				border = "curved",
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

		function _lazygit_toggle()
			lazygit:toggle()
		end

		vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
	end,
}
