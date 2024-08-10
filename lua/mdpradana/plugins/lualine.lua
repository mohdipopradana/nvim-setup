return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		opt = true,
	},
	config = function()
		local lualine = require("lualine")

		local function getLspName()
			local buf_clients = vim.lsp.buf_get_clients()
			local buf_ft = vim.bo.filetype
			if next(buf_clients) == nil then
				return "  No servers"
			end
			local buf_client_names = {}

			for _, client in pairs(buf_clients) do
				if client.name ~= "null-ls" then
					table.insert(buf_client_names, client.name)
				end
			end

			local lint_s, lint = pcall(require, "lint")
			if lint_s then
				for ft_k, ft_v in pairs(lint.linters_by_ft) do
					if type(ft_v) == "table" then
						for _, linter in ipairs(ft_v) do
							if buf_ft == ft_k then
								table.insert(buf_client_names, linter)
							end
						end
					elseif type(ft_v) == "string" then
						if buf_ft == ft_k then
							table.insert(buf_client_names, ft_v)
						end
					end
				end
			end

			local ok, conform = pcall(require, "conform")
			local formatters = table.concat(conform.formatters_by_ft[vim.bo.filetype], " ")
			if ok then
				for formatter in formatters:gmatch("%w+") do
					if formatter then
						table.insert(buf_client_names, formatter)
					end
				end
			end
			local hash = {}
			local unique_client_names = {}

			for _, v in ipairs(buf_client_names) do
				if not hash[v] then
					unique_client_names[#unique_client_names + 1] = v
					hash[v] = true
				end
			end
			local language_servers = table.concat(unique_client_names, ", ")

			return " " .. language_servers
		end

		local lsp = {
			function()
				return getLspName()
			end,
		}

		-- Change colorschemes from Lualine plugin
		local custom_color = require("lualine.themes.gruvbox")
		-- Gruvbox colorschemes
		local colors = {
			black = "#000000",
			white = "#ffffff",
			br = "#423b39",
			line = "#2b2928",
			normal = "#83a598",
			insert = "#fabd2f",
			visual = "#8ec07c",
			command = "#d65d0e",
		}
		-- Custom colorscheme
		custom_color.normal = {
			a = { bg = colors.normal, fg = colors.black, gui = "bold" },
			b = { bg = colors.br, fg = colors.white },
			c = { bg = colors.line, fg = colors.white },
		}
		custom_color.insert = {
			a = { bg = colors.insert, fg = colors.black, gui = "bold" },
			b = { bg = colors.br, fg = colors.white },
			c = { bg = colors.line, fg = colors.white },
		}
		custom_color.visual = {
			a = { bg = colors.visual, fg = colors.black, gui = "bold" },
			b = { bg = colors.br, fg = colors.white },
			c = { bg = colors.line, fg = colors.white },
		}
		custom_color.replace = {
			a = { bg = colors.command, fg = colors.black, gui = "bold" },
			b = { bg = colors.br, fg = colors.white },
			c = { bg = colors.line, fg = colors.white },
		}
		custom_color.command = {
			a = { bg = colors.command, fg = colors.black, gui = "bold" },
			b = { bg = colors.br, fg = colors.white },
			c = { bg = colors.line, fg = colors.white },
		}
		custom_color.inactive = {
			a = { bg = colors.line, fg = colors.white, gui = "bold" },
			b = { bg = colors.br, fg = colors.gray },
			c = { bg = colors.line, fg = colors.white },
		}

		-- Plugin setup
		lualine.setup({
			options = {
				icons_enabled = true,
				theme = custom_color,
				-- component_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},

			sections = {
				lualine_a = {
					{
						"mode",
						padding = 1,
						icons_enabled = true,
						icon = "",
					},
				},
				lualine_b = {
					{ "branch", icons_enabled = true, icon = "" },
					{
						"diff",
						colored = false,
						diff_color = {
							added = "LualineDiffAdd",
							modified = "LualineDiffChange",
							removed = "LualineDiffDelete",
						},
						symbols = { added = "+", modified = "~", removed = "-" },
					},
				},
				lualine_c = {
					-- {
					-- 	"filename",
					-- 	file_status = true,
					-- 	newfile_status = false,
					-- 	path = 5,
					-- 	shorting_target = 40,
					-- 	symbols = {
					-- 		modified = "[~]",
					-- 		readonly = "[!]",
					-- 		unnamed = "[No Name]",
					-- 		newfile = "[New]",
					-- 	},
					-- },
					{
						"diagnostics",
						sources = { "nvim_lsp" },
						sections = { "error", "warn", "hint", "info" },
						symbols = { error = " ", warn = " ", hint = " ", info = " " },
						diagnostics_color = {
							error = "LualineError",
							warn = "LualineWarn",
							hint = "LualineHint",
							info = "LualineInfo",
						},
						colored = true,
						update_in_insert = true,
					},
				},
				lualine_x = {},
				lualine_y = { "filetype", lsp },
				lualine_z = {
					{
						"location",
						padding = 1,
						icons_enabled = true,
						-- icon = "",
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = { "filename" },
				lualine_c = {},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "neo-tree" },
		})
	end,
}
