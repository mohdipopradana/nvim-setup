-- KEYMAPS SETTINGS

-- Set alias
local g = vim.g
local map = vim.keymap.set

-- Remap <leader> to space key
g.mapleader = " "

-- Keymap to go to normal mode
map("i", "<C-c>", "<ESC>")

-- Keymap to open netrw
map("n", "<S-x>", vim.cmd.Ex)

-- Keymap for delete and make cursor still in front of line
-- Take the line from the bottom position to side position on line before
map("n", "<S-j>", "mzJ`z")

-- Resize vim window
-- Decrease vim window
map("n", "_", ":resize -2<CR>")
-- Increase vim window
map("n", "+", ":resize +2<CR>")

-- Keymap to move line constantly on visual mode
map("v", "<S-j>", ":m '>+1<CR>gv=gv")
map("v", "<S-k>", ":m '<-2<CR>gv=gv")

-- Keymap for move to above or below line while doing "SEARCH TEXT" using /... and set cursor always in front of word that we search
-- Scroll down and keep cursor always in front of word
map("n", "n", "nzzzv")
-- Scroll up and keep cursor always in front of word
map("n", "<S-n>", "Nzzzv")

-- Keymap to split vim
map("n", "hs", vim.cmd.split)
map("n", "vs", vim.cmd.vsplit)

-- Keymap to move half page jumping
-- Move half page jumping down below
map("n", "<C-d>", "<C-d>zz")
-- Move half page jumping up above
map("n", "<C-u>", "<C-u>zz")

-- Keymap for paste file without lose the first text that copied before
map("x", "<leader>p", [["_dP]])

-- Keymap to move focus window if vim splitted
map("n", "<leader><leader>", "<C-w>w")
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")

-- Keymap to replace string with very great way
map("n", "<leader>t", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Keymap to make executable file using chmod
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = false })

-- Keymap to copy text from vim to system clipboard
-- The different between y and <leader>y is y only copy your text on vim
-- And <leader> y would copy your text to your system clipboard and bring them outside vim
-- You should to press <leader>yy if want to copy line or <leader>y and ap if want to copy a whole paragraph
map({ "n", "v" }, "<leader>y", [["+y]])

-- Keymap for open new tmux session
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
