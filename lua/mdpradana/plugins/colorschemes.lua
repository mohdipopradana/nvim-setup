return {
	-- Colorscheme
	"ellisonleao/gruvbox.nvim",
	config = function()
		-- Gruvbox colorscheme
		local colors = {
			bg = "#1d2021",
			bd = "#fcdbc0",
			black = "#141617",
			white = "#ffffff",
			red = "#fb4934",
			blue = "#778aed",
			yellow = "#ebd40c",
			aqua = "#8ec07c",
			cursorline = "#212525",
			visual = "#3c3836",
			normalbg = "#83a598",
			line = "#2b2928",
			gitadd = "#399918",
			gitmodify = "#4535C1",
			gitremove = "#fb4934",
		}

		local gruvbox_theme = require("gruvbox")
		gruvbox_theme.setup({
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				operators = false,
				comments = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "dark", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {
				Normal = { bg = colors.bg },
				NormalFloat = { bg = "none" },
				NormalNC = { bg = "none" },
				Visual = { bg = colors.visual },
				NonText = { bg = "none" },
				FloatTitle = { fg = colors.bd, bg = "none" },
				FloatBorder = { fg = colors.bd, bg = "none" },
				CursorLine = { bg = colors.cursorline },
				ColorColumn = { bg = colors.cursorline },
				CursorLineNr = { bg = "none" },
				SignColumn = { bg = "none" },
				DiagnosticSignError = { fg = colors.red, bg = "none" },
				DiagnosticSignWarn = { fg = colors.yellow, bg = "none" },
				DiagnosticSignHint = { fg = colors.blue, bg = "none" },
				DiagnosticSignInfo = { fg = colors.white, bg = "none" },
				DiagnosticVirtualTextError = { fg = colors.red, bg = "none" },
				DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = "none" },
				DiagnosticVirtualTextHint = { fg = colors.blue, bg = "none" },
				DiagnosticVirtualTextInfo = { fg = colors.aqua, bg = "none" },
				TelescopeSelection = { fg = colors.yellow, bg = colors.visual },
				TelescopeSelectionCaret = { fg = colors.yellow, bg = colors.visual, bold = true },
				TelescopePromptPrefix = { fg = colors.yellow },
				LualineError = { bg = colors.line, fg = colors.red },
				LualineWarn = { bg = colors.line, fg = colors.yellow },
				LualineHint = { bg = colors.line, fg = colors.blue },
				LualineInfo = { bg = colors.line, fg = colors.aqua },
				LualineDiffAdd = { bg = colors.line },
				LualineDiffChange = { bg = colors.line },
				LualineDiffDelete = { bg = colors.line },
				ModeMsg = { fg = colors.white, bold = true },
			},
			dim_inactive = false,
			transparent_mode = false,
		})
		vim.cmd("colorscheme gruvbox")
	end,
}
