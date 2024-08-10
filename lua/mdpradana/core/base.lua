-- BASIC SETTINS
-- Set alias
local o = vim.o
local opt = vim.opt

-- Set text encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Set update time
o.updatetime = 10

-- Set number of screen lines to keep above and below the cursor
opt.scrolloff = 8

-- Add line number and relative number
o.number = true
o.relativenumber = true

-- Set pixel size of space from the side line
o.numberwidth = 5

-- Set title
o.title = true

-- Set cursorline for sign where we are
o.cursorline = true
opt.colorcolumn = "140"

-- Set space size of indent setting
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

-- Set auto indent and make indent much smarter while write some syntax
o.autoindent = true
o.smartindent = true

-- Set neovim to enable undo file
o.undofile = true
o.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Set neovim to disable swap file
o.swapfile = false

-- Set neovim to disable highlight search
opt.hlsearch = false

-- Set neovim to enable incremental search
opt.incsearch = true

-- Set fish as default shell
--opt.shell = 'fish'

-- Set neovim to disable wrap text
opt.wrap = false

-- Set cursor to block on all modes in nvim
o.guicursor = "a:block"

-- Set blink off while in normal and visual mode
o.guicursor = "n-v-:blinkon0"

-- Set blink on while in command and  insert mode
o.guicursor = "c-i:blinkon100"

-- Set timeout time to map key
opt.timeoutlen = 600
opt.termguicolors = true

-- Set cursorline
opt.cursorline = true
