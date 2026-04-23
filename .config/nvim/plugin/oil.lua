vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })

local oil = require('oil')

oil.setup({
  default_file_explorer = true,
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true,
    natural_order = true,
  },
  keymaps = {
    ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
    ['<C-h>'] = false,
    ['<C-s>'] = { 'actions.select', opts = { horizontal = true } },
  },
})

vim.keymap.set('n', '<leader>ee', oil.toggle_float, { desc = 'Oil: Open in floating window' })
vim.keymap.set('n', '<leader>eo', oil.open, { desc = 'Oil: Open' })
vim.keymap.set('n', '<leader>eq', oil.close, { desc = 'Oil: Close' })
vim.keymap.set('n', '<leader>ep', oil.open_preview, { desc = 'Oil: Open preview' })
