return {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      format = { enable = false },
      hint = {
        enable = true,
        arrayIndex = 'Disable',
      },
      runtime = { version = 'LuaJIT' },
      telemetry = { enable = false },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    },
  },
}
