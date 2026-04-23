vim.pack.add({ 'https://github.com/mfussenegger/nvim-lint' })

local lint = require('lint')

lint.linters_by_ft = {
  -- python = { 'ruff' },
  javascript = { 'oxlint' },
  typescript = { 'oxlint' },
  javascriptreact = { 'oxlint' },
  typescriptreact = { 'oxlint' },
}

-- Trigger linting
local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

vim.keymap.set('n', '<leader>ll', function()
  lint.try_lint()
end, { desc = 'Trigger linting' })
