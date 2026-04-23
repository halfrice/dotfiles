vim.pack.add({
  'https://github.com/theHamsta/nvim-dap-virtual-text',
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/rcarriga/nvim-dap-ui',
  'https://github.com/mfussenegger/nvim-dap-python',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/jay-babu/mason-nvim-dap.nvim',
})

local dap = require('dap')

require('mason-nvim-dap').setup({
  automatic_installation = true,
  handlers = {},
  ensure_installed = {
    'debugpy',
    'js-debug-adapter',
  },
})

local dapui = require('dapui')
dapui.setup({
  icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
  controls = {
    icons = {
      pause = '⏸',
      play = '▶',
      step_into = '⏎',
      step_over = '⏭',
      step_out = '⏮',
      step_back = 'b',
      run_last = '▶▶',
      terminate = '⏹',
      disconnect = '⏏',
    },
  },
})

require('nvim-dap-virtual-text').setup()
vim.g.dap_virtual_text = true

-- Listeners
dap.listeners.after.event_initialized.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

require('dap-python').setup(vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python')

-- Adapters
dap.adapters['node'] = {
  type = 'server',
  host = 'localhost',
  port = '${port}',
  executable = {
    command = 'node',
    args = { vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js', '${port}' },
  },
}

dap.adapters['chrome'] = {
  type = 'server',
  host = 'localhost',
  port = '${port}',
  executable = {
    command = 'node',
    args = { vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js', '${port}' },
  },
}

-- Adapter Configurations
local languages = {
  'javascript',
  'typescript',
  'javascriptreact',
  'typescriptreact',
}

for _, lang in ipairs(languages) do
  dap.configurations[lang] = {
    -- Auto-attach node
    {
      name = 'Auto-attach (node)',
      type = 'node',
      request = 'attach',
      cwd = '${workspaceFolder}',
      sourceMaps = true,
      skipFiles = { '<node_internals>/**' },
    },

    -- Next.js config
    -- nextjs.org/docs/pages/guides/debugging
    {
      name = 'Next.js: debug server-side (launch node)',
      type = 'node',
      request = 'launch',
      command = 'npm run dev -- --inspect',
    },
    {
      name = 'Next.js: debug client-side (launch Chrome)',
      type = 'chrome',
      request = 'launch',
      url = 'http://localhost:3000',
      sourceMaps = true,
      webRoot = '${workspaceFolder}',
    },
    {
      name = 'Next.js: debug full stack (launch node & Chrome)',
      type = 'node',
      request = 'launch',
      program = '${workspaceFolder}/node_modules/next/dist/bin/next',
      runtimeArgs = { '--inspect' },
      skipFiles = { '<node_internals>/**' },
      serverReadyAction = {
        action = 'debugWithChrome',
        killOnServerStop = true,
        pattern = '- Local:.+(https?://.+)',
        uriFormat = '%s',
        webRoot = '${workspaceFolder}',
      },
      cwd = '${workspaceFolder}',
    },

    -- WIP: Next.js debugging is currently bugged
    {
      name = 'Next.js: debug server-side',
      type = 'node',
      request = 'attach',
      port = 9230,
      localRoot = vim.fn.getcwd(),
      remoteRoot = '/usr/src/app',
      cwd = '${workspaceFolder}',
      sourceMaps = true,
      resolveSourceMapLocations = {
        '${workspaceFolder}/**',
        '!**/node_modules/**',
      },
      skipFiles = { '<node_internals>/**', 'node_modules/**' },
      protocol = 'inspector',
      autoAttachChildProcess = true,
    },
  }
end

-- Keymaps
vim.keymap.set('n', '<leader>dd', function()
  dap.continue()
end, { desc = 'Dap' })
vim.keymap.set('n', '<leader>dc', function()
  dap.continue()
end, { desc = 'Dap: Continue' })
vim.keymap.set('n', '<leader>ddt', function()
  dap.terminate()
end, { desc = 'Dap: Stop' })
vim.keymap.set('n', '<leader>di', function()
  dap.step_into()
end, { desc = 'Dap: Step Into' })
vim.keymap.set('n', '<leader>do', function()
  dap.step_over()
end, { desc = 'Dap: Step Over' })
vim.keymap.set('n', '<leader>dO', function()
  dap.step_out()
end, { desc = 'Dap: Step Out' })
vim.keymap.set('n', '<leader>db', function()
  dap.toggle_breakpoint()
end, { desc = 'Dap: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dB', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, { desc = 'Dap: Set Breakpoint' })
vim.keymap.set('n', '<leader>du', function()
  dapui.toggle()
end, { desc = 'Toggle Dapui' })
vim.keymap.set('n', '<leader>dU', function()
  dapui.open()
end, { desc = 'Open Dapui' })
vim.keymap.set('n', '<leader>dx', function()
  dapui.close()
end, { desc = 'Close Dapui' })
vim.keymap.set('n', '<leader>de', function()
  dapui.eval()
end, { desc = 'Dapui: Evaluate' })
