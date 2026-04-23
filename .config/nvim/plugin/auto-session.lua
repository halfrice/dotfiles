vim.pack.add({
  'https://github.com/rmagatti/auto-session',
  -- 'https://github.com/nvim-tree/nvim-tree.lua',
})

require('auto-session').setup({
  auto_session_suppress_dirs = {
    '/',
    '~/',
    '~/Applications/',
    '~/Desktop/',
    '~/Documents',
    '~/Downloads',
    '~/Library/',
    '~/Movies/',
    '~/Music/',
    '~/Pictures/',
    '~/Podcasts/',
    '~/Public/',
  },
  post_restore_cmds = {
    -- function()
    --   local nvim_tree = require('nvim-tree.api')
    --   nvim_tree.tree.change_root(vim.fn.getcwd())
    --   nvim_tree.tree.open()
    -- end,
  },
})

vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

vim.keymap.set('n', '<leader>pr', '<cmd>AutoSession restore<cr>', { desc = 'Load session' })
vim.keymap.set('n', '<leader>ps', '<cmd>AutoSession save<cr>', { desc = 'Save session' })
vim.keymap.set('n', '<leader>pd', '<cmd>AutoSession delete<cr>', { desc = 'Delete session' })
vim.keymap.set('n', '<leader>p/', '<cmd>AutoSession search<cr>', { desc = 'Search session' })
vim.keymap.set('n', '<leader>pt', '<cmd>AutoSession toggle<cr>', { desc = 'Toggle session' })
