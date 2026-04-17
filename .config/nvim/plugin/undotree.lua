vim.pack.add({ 'https://github.com/mbbill/undotree' })

vim.g.undotree_WindowLayout = 2
vim.g.undotree_SplitWidth = 32
vim.g.undotree_SetFocusWhenToggle = 1

vim.keymap.set('n', '<leader>uu', '<cmd>UndotreeToggle<cr>', { desc = 'Undotree' })
