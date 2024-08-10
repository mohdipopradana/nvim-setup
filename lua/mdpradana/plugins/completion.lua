return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local cmp = require("cmp")

		-- Gruvbox colorscheme
		local colors = {
			bg = "#1d2021",
			bd = "#d5c4a1",
			hl = "#83a598",
			text_sel = "#000000",
		}

		-- Colorish colorscheme
		-- local colors = {
		-- 	bg = "#1c1c1c",
		-- 	bd = "#565f89",
		-- 	hl = "#778aed",
		-- 	text_sel = "#000000",
		-- }

		-- Float completion popup
		-- Gruvbox colorscheme
		vim.api.nvim_set_hl(0, "Menu", { bg = colors.bg })
		vim.api.nvim_set_hl(0, "Border", { fg = colors.bd })
		vim.api.nvim_set_hl(0, "Select", { bg = colors.hl, fg = colors.text_sel, bold = true })

		local kind_icons = {
			Text = "",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰇽",
			Variable = "󰂡",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "",
		}

		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			window = {
				completion = cmp.config.window.bordered({
					winhighlight = "Normal:Menu,FloatBorder:Border,CursorLine:Select,Search:none",
					border = "rounded",
					scrollbar = false,
				}),
				documentation = cmp.config.window.bordered({
					winhighlight = "Normal:Menu,FloatBorder:Border",
					border = "rounded",
				}),
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-c>"] = cmp.mapping.close({ remap = true }),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "nvim_lua" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				format = function(entry, vim_item)
					vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip = "[Luasnip]",
						nvim_lua = "[Lua]",
						buffer = "[Buffer]",
						path = "[Path]",
						["vim-dadbod-completion"] = "[DB]",
					})[entry.source.name]
					return vim_item
				end,
			},
			fields = { "abbr", "kind" },
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "sql", "mysql", "plsql" },
			callback = function()
				require("cmp").setup.buffer({
					sources = {
						{ name = "vim-dadbod-completion" },
						{ name = "buffer" },
						{ name = "luasnip" },
					},
				})
			end,
		})
	end,
}
