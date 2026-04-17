vim.pack.add({ 'https://github.com/folke/snacks.nvim' })

local snacks = require('snacks')

snacks.setup({
  bigfile = { enabled = true },
  dashboard = { enabled = false },
  explorer = { enabled = false },
  indent = { enabled = true },
  input = { enabled = false },
  picker = { enabled = false },
  notifier = { enabled = false },
  quickfile = { enabled = true },
  scope = { enabled = false },
  scroll = { enabled = false },
  statuscolumn = { enabled = false },
  words = { enabled = false },
  lazygit = { enabled = true },
})

vim.keymap.set('n', '<leader>dd', function()
  snacks.dashboard.open()
end, { desc = 'Snacks Dashboard' })
vim.keymap.set('n', '<leader>gg', function()
  snacks.lazygit.open()
end, { desc = 'Lazygit' })
