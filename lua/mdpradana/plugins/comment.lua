return {
	"tpope/vim-commentary",
	lazy = false,
}

-- return {
-- 	"numToStr/Comment.nvim",
-- 	lazy = false,
-- 	config = function()
-- 		local comment = require("Comment")
-- 		comment.setup({
-- 			-- Add a space b/w comment and the line
-- 			padding = true,
-- 			-- Whether the cursor should stay at its position
-- 			sticky = true,
-- 			-- Lines to be ignored while (un)comment
-- 			ignore = nil,
-- 			-- LHS of toggle mappings in NORMAL mode
-- 			toggler = {
-- 				-- Line-comment toggle keymap
-- 				line = "cl",
-- 				-- Block-comment toggle keymap
-- 				block = "cs",
-- 			},
-- 			-- LHS of operator-pending mappings in NORMAL and VISUAL mode
-- 			opleader = {
-- 				-- Line-comment keymap
-- 				line = "cl",
-- 				-- Block-comment keymap
-- 				block = "cs",
-- 			},
-- 		})
-- 	end,
-- }
