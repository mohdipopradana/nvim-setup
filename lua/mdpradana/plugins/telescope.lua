-- TELESCOPE PLUGIN SETTINGS
return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")

		local builtin = require("telescope.builtin")

		local actions = require("telescope.actions")

		local map = vim.keymap.set

		require("telescope").load_extension("file_browser")

		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					height = 30,
					width = 150,
				},
				extensions = {
					file_browser = {
						-- dir_icon_hl = "#ffffff",
					},
				},
				mappings = {
					i = {
						-- Move to previous selection
						["<C-k>"] = actions.move_selection_previous,
						-- Move to next selection
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
		})

		-- Keymap for browse file on project directory
		map("n", "<leader>ff", "<cmd>Telescope file_browser hidden=true<CR>", { desc = "Find files in cwd" })

		-- Keymap for open recently file that was opened
		map("n", "<leader>fr", builtin.oldfiles, { desc = "Open recent files" })

		-- Keymap for find string in current working directory
		map("n", "<leader>fs", builtin.live_grep, { desc = "Find string in CWD" })

		-- Keymap for find string on under cursor in current working directory
		map("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in CWD" })

		-- Keymap to open help from telescope documentation
		map("n", "<leader>fh", builtin.help_tags, { desc = "Find information and help" })
	end,
}
