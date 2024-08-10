-- Disable comment in every new line

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	desc = "Disable comment in every new line",
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.api.nvim_set_hl(0, "IncSearch", { fg = "#1c1c1c", bg = "#fabd2f" })
		vim.highlight.on_yank()
	end,
	desc = "Briefly highlight yanked text",
})
