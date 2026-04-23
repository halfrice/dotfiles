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

  -- Bufferline, Tokyonight, transparency and highlight colors are bugged
  -- Fix: Manually go through :help bufferline-highlights and style utilized elements
  highlights = {
    fill = {
      bg = 'none',
    },
    background = {
      fg = '#565f89',
      bg = 'none',
    },
    close_button = {
      bg = 'none',
    },
    close_button_visible = {
      bg = 'none',
    },
    close_button_selected = {
      bg = 'none',
    },
    buffer_visible = {
      fg = '#565f89',
      bg = 'none',
    },
    buffer_selected = {
      fg = '#c0caf5',
      bg = 'none',
    },
    modified = {
      bg = 'none',
    },
    modified_visible = {
      bg = 'none',
    },
    modified_selected = {
      bg = 'none',
    },
    duplicate_selected = {
      fg = '#c0caf5',
      bg = 'none',
      bold = true,
    },
    duplicate_visible = {
      fg = '#565f89',
      bg = 'none',
    },
    duplicate = {
      fg = '#565f89',
      bg = 'none',
    },
    separator = {
      bg = 'none',
    },
    separator_selected = {
      bg = 'none',
    },
    separator_visible = {
      bg = 'none',
    },
    indicator_visible = {
      bg = 'none',
    },
    indicator_selected = {
      bg = 'none',
    },
    pick_selected = {
      bg = 'none',
    },
    pick_visible = {
      bg = 'none',
    },
    pick = {
      bg = 'none',
    },
    offset_separator = {
      bg = 'none',
    },
    trunc_marker = {
      fg = '#565f89',
      bg = 'none',
    },
  },
})

vim.keymap.set('n', '<leader>bb', '<cmd>BufferLinePick<cr>', { desc = 'Pick buffer' })
vim.keymap.set('n', '<leader>bq', '<cmd>BufferLinePickClose<cr>', { desc = 'Pick buffer to close' })
vim.keymap.set('n', '<leader>ba', '<cmd>BufferLineCloseOthers<cr>', { desc = 'Close all other buffers' })
vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCloseRight<cr>', { desc = 'Close buffers to the right' })
vim.keymap.set('n', '<leader>bh', '<cmd>BufferLineCloseLeft<cr>', { desc = 'Close buffers to the left' })
vim.keymap.set('n', '<leader><tab>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader><s-tab>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev buffer' })
