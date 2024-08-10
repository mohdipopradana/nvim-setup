return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		local icon = require("nvim-web-devicons")
		icon.setup({
			-- your personnal icons can go here (to override)
			-- DevIcon will be appended to `name`
			override = {},
			-- globally enable different highlight colors per icon (default to true)
			-- if set to false all icons will have the default icon's color
			color_icons = true,
			-- globally enable default icons (default to false)
			-- will get overriden by `get_icons` option
			default = true,
		})
	end,
}
