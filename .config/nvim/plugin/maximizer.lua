vim.pack.add({ 'https://github.com/szw/vim-maximizer' })

vim.keymap.set('n', '<leader>m', '<cmd>MaximizerToggle<cr>', { desc = 'Maximize window split' })
