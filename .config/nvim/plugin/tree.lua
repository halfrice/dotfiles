vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-tree/nvim-tree.lua',
})

local tree = require('nvim-tree')

tree.setup({
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
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
    },
  },
  sort = {
    sorter = 'case_sensitive',
  },
  view = {
    -- cursorline = false,
    number = false,
    relativenumber = false,
    signcolumn = 'no',
    width = 32,
  },
})

-- Starts Neovim with tree window closed
local tree_api = require('nvim-tree.api')
vim.api.nvim_create_autocmd('UIEnter', {
  once = true,
  callback = function()
    local name = vim.api.nvim_buf_get_name(0)
    if name:find('NvimTree_1') and tree_api.tree.is_visible() then
      tree_api.tree.close()
    end
  end,
})

vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle nvim-tree' })
vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFileToggle<cr>', { desc = 'Toggle nvim-tree @ current file' })
vim.keymap.set('n', '<leader>ew', '<cmd>NvimTreeCollapse<cr>', { desc = 'Collapse nvim-tree folders' })
vim.keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<cr>', { desc = 'Refresh nvim-tree' })
