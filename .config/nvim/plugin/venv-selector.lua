vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  {
    src = 'https://github.com/nvim-telescope/telescope.nvim',
    version = 'master',
  },
  'https://github.com/linux-cultist/venv-selector.nvim',
})

local venv_selector = require('venv-selector')

venv_selector.setup({
  options = {
    statusline_func = {
      lualine = function()
        local venv_path = venv_selector.venv()
        if not venv_path or venv_path == '' then
          return ''
        end

        local venv_name = vim.fn.fnamemodify(venv_path, ':t')
        if not venv_name then
          return ''
        end

        local output = '🐍 ' .. venv_name .. ' '
        return output
      end,
    },
  },
})

vim.keymap.set('n', '<leader>pv', '<cmd>VenvSelect<cr>', { desc = 'Select Python VENV' })
