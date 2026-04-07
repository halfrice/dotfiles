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
