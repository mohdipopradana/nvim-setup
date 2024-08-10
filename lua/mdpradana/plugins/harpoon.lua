return {
	"ThePrimeagen/harpoon",
	config = function()
		local map = vim.keymap.set
		local harpoon = require("harpoon")
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		harpoon.setup({})
		-- Keymap to open harpoon menu
		map("n", "<leader>hw", ui.toggle_quick_menu, { desc = "Open harpoon window" })

		-- Keymap to add file to harpoon
		map("n", "<leader>ha", mark.add_file, { desc = "Add file to harpoon" })

		-- Keymap to navigate between one file to another
		map("n", "<S-u>", function()
			ui.nav_file(1)
		end)

		map("n", "<S-i>", function()
			ui.nav_file(2)
		end)

		map("n", "<S-o>", function()
			ui.nav_file(3)
		end)

		map("n", "<S-p>", function()
			ui.nav_file(4)
		end)
	end,
}
