return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")
		-- Plugin setup
		treesitter.setup({
			-- Set list parse of language that want to install
			ensure_installed = {
				"c",
				"clojure",
				"css",
				"cpp",
				"go",
				"html",
				"java",
				"javascript",
				"lua",
				"ocaml",
				"python",
				"sql",
				"rust",
				"typescript",
				"vim",
				"vimdoc",
			},

			-- Set install parsers synchronously
			sync_install = true,

			-- Set to automatically install missing parsers when entering buffer
			auto_install = true,

			-- Enable indenting text
			indent = {
				enable = true,
			},

			-- Enable highlighting
			highlight = {
				enable = true,

				-- Disable regex highlighting
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
