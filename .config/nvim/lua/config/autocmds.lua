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

-- Toggles command line to show recording message when needed
-- Only needed if vim.opt.cmdheight = 0
vim.api.nvim_create_autocmd('RecordingEnter', {
  callback = function()
    vim.opt.cmdheight = 1
  end,
})
vim.api.nvim_create_autocmd('RecordingLeave', {
  callback = function()
    vim.opt.cmdheight = 0
  end,
})
