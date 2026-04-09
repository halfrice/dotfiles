vim.pack.add({
  {
    src = 'https://github.com/nvim-telescope/telescope.nvim',
    version = 'latest_release_tag',
  },
  -- Dependencies
  {
    src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    build = 'make', -- TODO: Fix build command
  },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
})

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    path_display = { 'smart' },
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
})

telescope.load_extension('fzf')

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Find recent files' })
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', { desc = 'Find string' })
vim.keymap.set('n', '<leader>fS', '<cmd>Telescope grep_string<cr>', { desc = 'Find string under cursor' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope commands<cr>', { desc = 'Find commands' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Find help documents' })
