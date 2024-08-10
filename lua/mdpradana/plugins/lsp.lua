return {
	"neovim/nvim-lspconfig",
	lazy = false,
	event = "VimEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local map = vim.keymap.set
		local nvim_lsp = require("lspconfig")

		-- Set capabilities of LSP using nvim-cmp
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Global mappings
		map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Open Diagnostic" })
		map("n", "<C-k>", vim.diagnostic.goto_prev, { desc = "Go to Previous Diagnostic" })
		map("n", "<C-j>", vim.diagnostic.goto_next, { desc = "Go to Next Diagnostic" })

		local on_attach = function(_, bufnr)
			-- Mappings
			local opts = { buffer = bufnr, noremap = true, silent = true }
			-- Set keymap for LSP in current buffer
			map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts, { desc = "Jump to definition" })
			map("n", "gD", vim.lsp.buf.declaration, opts, { desc = "Jump to declaration" })
			map("n", "gr", "<cmd>Telescope lsp_references<CR>", opts, { desc = "Open LSP references" })
			map("n", "<leader>ll", "<cmd>Telescope diagnostics<CR>", opts, { desc = "Open LSP location diagnostics" })
			map("n", "<leader>lh", vim.lsp.buf.signature_help, opts, { desc = "Open signature help" })
			map("n", "<leader>ln", vim.lsp.buf.rename, opts, { desc = "Rename word" })
			map("n", "<leader>la", vim.lsp.buf.code_action, opts, { desc = "Open code action" })
			map("n", "<leader>lv", vim.lsp.buf.hover, opts, { desc = "Open hover" })
			map("n", "<leader>ls", vim.lsp.buf.workspace_symbol, opts, { desc = "Open workspace symbol" })
			-- map("n", "gd", vim.lsp.buf.definition, opts, { desc = "Jump to definition" })
			-- map("n", "gr", vim.lsp.buf.references, opts)
		end

		-- Add signs icon to make diagnostic signs much easier to read
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			-- Diagnostic information
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
				},
				signs = true,
				underline = false,
				update_in_insert = true,
				float = {
					border = "rounded",
					focusable = true,
				},
			})

			-- Lua
			nvim_lsp.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			-- C++
			nvim_lsp.clangd.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- Python
			nvim_lsp.jedi_language_server.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- Golang
			nvim_lsp.gopls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- OCaml
			nvim_lsp.ocamllsp.setup({
				cmd = { "ocamllsp" },
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
				root_dir = nvim_lsp.util.root_pattern(
					"*.opam",
					"esy.json",
					"package.json",
					".git",
					"dune-project",
					"dune-workspace"
				),
			})

			-- Rust
			nvim_lsp.rust_analyzer.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- Java
			nvim_lsp.jdtls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- SQL
			nvim_lsp.sqlls.setup({
				cmd = { "sql-language-server", "up", "--method", "stdio" },
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "sql", "mysql" },
				root_dir = function()
					return vim.loop.cwd()
				end,
			})

			-- HTML
			-- nvim_lsp.html.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- })

			-- CSS
			-- nvim_lsp.cssls.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- })

			-- CSS
			-- nvim_lsp.tailwindcss.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- })

			-- JavaScript
			-- nvim_lsp.quick_lint_js.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- 	filetypes = { "js", "jsx" },
			-- })

			-- JavaScript
			-- nvim_lsp.eslint.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- 	filetypes = { "js", "jsx" },
			-- })
			--
			--  TypeScript
			-- nvim_lsp.tsserver.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- 	filetypes = { "ts", "tsx" },
			-- })

			-- Emmet
			-- nvim_lsp.emmet_language_server.setup({
			-- 	filetypes = {
			-- 		"css",
			-- 		"eruby",
			-- 		"html",
			-- 		"javascript",
			-- 		"javascriptreact",
			-- 		"less",
			-- 		"sass",
			-- 		"scss",
			-- 		"svelte",
			-- 		"pug",
			-- 		"typescriptreact",
			-- 		"vue",
			-- 	},
			-- 	init_options = {
			-- 		--- @type string[]
			-- 		excludeLanguages = {},
			-- 		--- @type string[]
			-- 		extensionsPath = {},
			-- 		--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
			-- 		preferences = {},
			-- 		--- @type boolean Defaults to `true`
			-- 		showAbbreviationSuggestions = true,
			-- 		--- @type "always" | "never" Defaults to `"always"`
			-- 		showExpandedAbbreviation = "always",
			-- 		--- @type boolean Defaults to `false`
			-- 		showSuggestionsAsSnippets = false,
			-- 		--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
			-- 		syntaxProfiles = {},
			-- 		--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
			-- 		variables = {},
			-- 	},
			-- })
		end

		-- Add border to hover
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			-- Use a sharp border with `FloatBorder` highlights
			border = "rounded",
			-- add the title in hover float window
			title = "Hover",
		})

		-- Add border to signature help
		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			-- Use a sharp border with `FloatBorder` highlights
			border = "rounded",
			-- add the title in signature help float window
			title = "Signature Help",
		})
	end,
}
