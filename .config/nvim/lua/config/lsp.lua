vim.lsp.enable({
  'lua-language-server',
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LspKeymaps', { clear = true }),
  callback = function()
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Actions' })
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Code Rename' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
    vim.keymap.set('n', '<leader>di', vim.diagnostic.open_float, { desc = 'Diagnostics' })
    vim.keymap.set('n', '<leader>ih', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = 'Toggle Inlay Hints' })
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = 'Goto Definitions' })
    vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, { desc = 'Goto Type Definitions' })
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { desc = 'Goto Implementations' })
    vim.keymap.set('n', '<leader>gs', vim.lsp.buf.signature_help, { desc = 'Goto Signature Help' })
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = 'Goto References' })
  end,
})
