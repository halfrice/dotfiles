-- Cut / Copy / Paste
vim.keymap.set('n', '<leader>y', '"*y', { desc = 'Copy to system clipboard' })
vim.keymap.set('v', '<leader>y', '"*y', { desc = 'Copy to system clipboard' })
vim.keymap.set('n', '<leader>Y', 'gg"*yG', { desc = 'Copy file to clipboard' })
vim.keymap.set('n', '<leader>X', 'gg"*dG', { desc = 'Cut file to clipboard' })
vim.keymap.set('v', '<leader>p', '"_dP', { desc = 'Paste from clipboard without overwriting' })
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
  desc = 'Modify and replace all words cursor is on with typed text',
})

-- Lines
-- Allows highlighted lines to be moved up or down as a block with auto-indentation
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', 'J', 'mzJ`z') -- Join next line with current line while keeping cursor in place

-- Navigation
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')

-- Indentation
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })

-- Scrolling
-- Half-page scrolling leaves cursor centered
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- Search terms stay centered
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Misc
vim.keymap.set('n', '<leader>rr', '<cmd>restart<cr>', { desc = 'Restart Neovim' })

-- Make file executable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- Clear search highlighs
vim.keymap.set({ 'n' }, '<esc>', function()
  vim.cmd('nohl')
  vim.cmd('stopinsert')

  -- Clear floating windows
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative == 'win' then
      vim.api.nvim_win_close(win, false)
    end
  end
end, { desc = 'Clear search highlights' })
