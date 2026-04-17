-- Disable auto comment on new lines
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt.formatoptions = { c = false, r = false, o = false }
  end,
})

-- Flash highlights copied text
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ timeout = 218 })
  end,
})

-- Show / Hide cursorline when window is focused / unfocused
local default_cursor = vim.o.guicursor
vim.api.nvim_create_autocmd({ 'FocusGained', 'TabEnter', 'WinEnter', 'BufEnter', 'VimEnter' }, {
  callback = function()
    vim.o.guicursor = default_cursor
    vim.o.cursorline = true
  end,
})
vim.api.nvim_create_autocmd({ 'FocusLost', 'TabLeave', 'WinLeave', 'BufLeave' }, {
  callback = function()
    vim.o.guicursor = 'a:noCursor'
    vim.o.cursorline = false
  end,
})
