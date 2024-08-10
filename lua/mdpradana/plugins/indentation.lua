return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	commit = "258b5d899da7c681ce0e0225de32c593f3914c27",
	config = function()
		local indent = require("ibl")
		indent.setup({
			indent = { highlight = { "LineNr" }, char = "▏" },
		})
	end,
}
