return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	event = { "BufReadPre" },
	config = function()
		local map = vim.keymap.set
		local git_signs = require("gitsigns")

		map("n", "<leader>gj", "<cmd>Gitsigns next_hunk<CR>", { desc = "Git jump to next hunk" })
		map("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Git preview hunk in float mode " })
		map("n", "<leader>gi", "<cmd>Gitsigns preview_hunk_inline<CR>", { desc = "Git preview hunk in inline" })
		map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Git show line blame" })

		git_signs.setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "│" },
				topdelete = { text = "│" },
				changedelete = { text = "│" },
				untracked = { text = "┆" },
			},
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true,
			},
			auto_attach = true,
			attach_to_untracked = false,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		})
	end,
}
