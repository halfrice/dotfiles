-- vim.lsp.enable({
--   'lua_ls',
--   'basedpyright',
--   'ruff',
-- })

-- Disables hover capability from Ruff
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == 'ruff' then
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = 'LSP: Disable hover capability from Ruff',
})

-- LSP keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LspKeymaps', { clear = true }),
  callback = function()
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Actions' })
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Code Rename' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
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
