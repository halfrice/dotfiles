vim.pack.add({ 'https://github.com/akinsho/bufferline.nvim' })

require('bufferline').setup({
  options = {
    mode = 'buffers',
    show_buffer_icons = false,
    indicator_icon = ' ',
    separator_style = { '', '' },
    tab_size = 0,
    buffer_close_icon = '',
    modified_icon = '',
    close_icon = '',
  },
})

vim.keymap.set('n', '<leader>bb', '<cmd>BufferLinePick<cr>', { desc = 'Pick buffer' })
vim.keymap.set('n', '<leader>bq', '<cmd>BufferLinePickClose<cr>', { desc = 'Pick buffer to close' })
vim.keymap.set('n', '<leader>ba', '<cmd>BufferLineCloseOthers<cr>', { desc = 'Close all other buffers' })
vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCloseRight<cr>', { desc = 'Close buffers to the right' })
vim.keymap.set('n', '<leader>bh', '<cmd>BufferLineCloseLeft<cr>', { desc = 'Close buffers to the left' })
