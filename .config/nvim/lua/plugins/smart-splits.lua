vim.pack.add({ 'https://github.com/mrjones2014/smart-splits.nvim' })

local smart_splits = require('smart-splits')
smart_splits.setup()

-- Movement
vim.keymap.set('n', '<C-h>', smart_splits.move_cursor_left)
vim.keymap.set('n', '<C-j>', smart_splits.move_cursor_down)
vim.keymap.set('n', '<C-k>', smart_splits.move_cursor_up)
vim.keymap.set('n', '<C-l>', smart_splits.move_cursor_right)

-- Resize
vim.keymap.set('n', '<A-h>', smart_splits.resize_left)
vim.keymap.set('n', '<A-j>', smart_splits.resize_down)
vim.keymap.set('n', '<A-k>', smart_splits.resize_up)
vim.keymap.set('n', '<A-l>', smart_splits.resize_right)

-- Swap
vim.keymap.set('n', '<leader><C-h>', smart_splits.swap_buf_left, { desc = 'Move split left' })
vim.keymap.set('n', '<leader><C-j>', smart_splits.swap_buf_down, { desc = 'Move split up' })
vim.keymap.set('n', '<leader><C-k>', smart_splits.swap_buf_up, { desc = 'Move split down' })
vim.keymap.set('n', '<leader><C-l>', smart_splits.swap_buf_right, { desc = 'Move split right' })
