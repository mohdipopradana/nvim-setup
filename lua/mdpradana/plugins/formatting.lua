return {
	"stevearc/conform.nvim",
	config = function()
		local formatter = require("conform")

		formatter.setup({
			formatters_by_ft = {

				-- Lua
				lua = { "stylua" },

				-- C++
				cpp = { "clang-format" },

				-- Conform will run multiple formatters sequentially
				-- Python
				python = { "autopep8", "black", "isort" },

				-- Golang
				go = { "gofmt", "gofumpt" },

				-- OCaml
				ocaml = { "ocamlformat" },

				-- Rust
				rust = { "rustfmt" },

				-- SQL
				sql = { "sqlfmt", "sql-formatter" },

				-- HTML
				-- html = { "prettierd", "prettier" },

				-- CSS
				-- css = { "prettierd", "prettier" },

				-- Use a sub-list to run only the first available formatter
				-- JavaScript and JavaScript with React
				-- javascript = { "prettierd", "prettier" },
				-- javascriptreact = { "prettierd", "prettier" },

				-- TypeScript and TypeScript with React
				-- typescript = { "prettierd", "prettier" },
				-- typescriptreact = { "prettierd", "prettier" },
			},

			format_on_save = {
				lsp_fallback = false,
				async = false,
				timeout_ms = 500,
			},
		})

		vim.api.nvim_create_autocmd({ "BufReadPre", "BufWritePre", "BufNewFile" }, {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})

		-- vim.keymap.set({ "n", "v" }, "<leader>cf", function()
		-- 	formatter.format({
		-- 		lsp_fallback = true,
		-- 		async = false,
		-- 		timeout_ms = 1000,
		-- 	})
		-- end, { desc = "Format file or range (in visual mode)" })
	end,
}
