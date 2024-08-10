return {
	"mfussenegger/nvim-lint",
	config = function()
		-- local map = vim.keymap.set
		local linter = require("lint")

		linter.linters_by_ft = {
			-- C++
			cpp = { "cpp-lint" },

			-- Python
			python = { "pylint", "flake8" },

			-- Golang
			go = { "golangci-lint" },

			-- JavaScript and  javaScript with React
			javascript = { "eslint_d", "quick_lint_js" },
			javascriptreact = { "eslint_d", "quick_lint_js" },

			-- TypeScript and TypeScript with React
			typescript = { "eslint_d", "quick_lint_js" },
			typescriptreact = { "eslint_d", "quick_lint_js" },

			-- SQL
			sql = { "sqlfluff" },

			-- HTML
			html = { "tidy" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})

		-- map({ "n", "v" }, "<leader>lr", function()
		-- 	linter.try_lint()
		-- end)
	end,
}
