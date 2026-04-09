vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local opt = vim.opt

-- Indentation
opt.expandtab = true -- Team spaces gg ez
opt.tabstop = 2 -- Tab width
opt.shiftwidth = 2 -- Indent width
opt.shiftround = true -- Keeps indents at a multiple of shift width
opt.smartindent = true

-- Lines
opt.cursorline = true -- Highlights current line
opt.number = true -- Display the current line number
opt.relativenumber = true -- Shows distance of other lines relative to current
opt.statuscolumn = '%2l ' -- Sets the minimum spacing of the numbers column to 3
opt.signcolumn = 'number' -- Always shows sign column (left of line numbers)
opt.wrap = false -- Disables line wrapping
opt.scrolloff = 8 -- Lines to keep above and below current line
opt.sidescrolloff = 8 -- Columns to keep before and after cursor

-- Style
opt.termguicolors = true -- Enable 24-bit colors
opt.background = 'dark' -- Lighter highlight colors for dark theme
opt.virtualedit = 'block' -- Cursor 'noclip' in visual block mode
opt.cmdheight = 0 -- Hides the command line
opt.pumblend = 10 -- Popup-menu transparency
opt.pumheight = 10
-- Blinking cursor with calm blink rate. Syncs with music around 69 or 138 bpm
opt.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait436-blinkoff218-blinkon218-Cursor/lCursor'
opt.fillchars = { eob = ' ' } -- Hides the tidle(~) EOF chars

-- Splits
opt.splitbelow = true -- Horizontal split goes below
opt.splitright = true -- Vertical split goes right
opt.splitkeep = 'screen' -- Keep the text on the same screen line when splitting or resizing

-- Search
opt.hlsearch = true -- Highlights matches with search
opt.ignorecase = true -- Ignores case when searching
opt.incsearch = true -- Actively highlights match while typing search pattern
opt.smartcase = true -- Case sensitive searches when including capitalized letters

-- Files & Memory
opt.fileencoding = 'utf-8'
opt.backup = false -- Disables backup files
opt.swapfile = false -- Disables swap files
opt.undofile = true -- Saves undo history to a file
opt.undolevels = 10000 -- Maximum number of undos that are saved
opt.autowrite = true -- Auto-saves on certain events, e.g. swapping buffers
opt.confirm = true -- Confirm to save changes (if any) before exiting
opt.inccommand = 'nosplit' -- Shows the effects of a command incrementally in the buffer
opt.clipboard:append('unnamed,unnamedplus') -- Allows (p)aste to use system clipboard

-- Input
opt.backspace = 'indent,eol,start' -- Changes backspace to work 'normally'
opt.mouse = 'a'
opt.timeoutlen = 300 -- Timeout length for key combos
