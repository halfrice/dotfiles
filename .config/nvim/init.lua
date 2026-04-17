-- nvim-tree: disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Experimental loader for faster startups
if vim.loader then
  vim.loader.enable()
end

-- Config
require('options')
require('keymaps')
require('diagnostics')
require('autocmds')
require('lsp')

-- Experimental UI. No more ENTER to continue messages
require('vim._core.ui2').enable()
