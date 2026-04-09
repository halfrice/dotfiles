vim.pack.add({
  'https://github.com/nvim-tree/nvim-tree.lua',
  -- Dependencies
  'https://github.com/nvim-tree/nvim-web-devicons',
})

require('nvim-tree').setup({
  sort = {
    sorter = 'case_sensitive',
  },
  view = {
    number = false,
    relativenumber = false,
    signcolumn = 'no',
    width = 32,
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
    },
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  filters = {
    dotfiles = false,
    custom = {
      '.DS_Store',
    },
  },
  git = {
    ignore = false,
  },
})

vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle file explorer' })
vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFileToggle<cr>', { desc = 'Toggle file explorer on current file' })
vim.keymap.set('n', '<leader>ew', '<cmd>NvimTreeCollapse<cr>', { desc = 'Collapse file explorer' })
vim.keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<cr>', { desc = 'Refresh file explorer' })
