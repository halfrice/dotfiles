vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  {
    src = 'https://github.com/nvim-telescope/telescope.nvim',
    version = 'master',
  },
  {
    src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    build = 'make', -- TODO: Fix build command
  },
})

local telescope = require('telescope')
local actions = require('telescope.actions')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local config = require('telescope.config')

telescope.setup({
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      width = 0.95,
      height = 0.95,
      -- width = function(_, cols, _)
      --   return cols
      -- end,
      -- height = function(_, _, rows)
      --   return rows
      -- end,
      preview_width = 0.66,
    },
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

-- Messages picker
local function telescope_messages()
  local messages = vim.fn.execute('messages')
  local lines = vim.split(messages, '\n')

  local reversed = {}
  for i = #lines, 1, -1 do
    table.insert(reversed, lines[i])
  end

  pickers
    .new({ theme = 'dropdown' }, {
      prompt_title = 'Messages',
      finder = finders.new_table({ results = reversed }),
      sorter = config.values.generic_sorter({}),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local entry = require('telescope.actions.state').get_selected_entry()
          actions.close(prompt_bufnr)
          vim.fn.setreg('+', entry[1])
        end)
        return true
      end,
    })
    :find()
end

-- vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = '#565f89' })
-- vim.api.nvim_set_hl(0, 'TelescopeBorderTitle', { fg = '#c0caf5' })
-- vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = '#565f89' })
-- vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = '#c0caf5' })
-- vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = '#565f89' })
-- vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = '#c0caf5' })
-- vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = '#7aa2f7' })
-- vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = '#c0caf5' })

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Find recent files' })
vim.keymap.set('n', '<leader>/', '<cmd>Telescope live_grep<cr>', { desc = 'Find string' })
vim.keymap.set('n', '<leader>fw', '<cmd>Telescope grep_string<cr>', { desc = 'Find string under cursor' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope commands<cr>', { desc = 'Find commands' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Find help documents' })
vim.keymap.set('n', '<leader>fv', '<cmd>Telescope vim_options<cr>', { desc = 'Find vim options' })
vim.keymap.set('n', '<leader>fH', '<cmd>Telescope highlights<cr>', { desc = 'Find highlights' })
vim.keymap.set('n', '<leader>ft', '<cmd>Telescope treesitter<cr>', { desc = 'Find functions, variables, etc.' })
vim.keymap.set('n', '<leader>fm', telescope_messages, { desc = 'Find messages' })
