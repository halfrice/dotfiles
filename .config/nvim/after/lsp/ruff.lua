return {
  init_options = {
    settings = {
      configurationPreference = 'filesystemFirst',
      -- lineLength = 88,
    },
  },
  capabilities = {
    general = {
      -- Fix offset encoding errors
      positionEncodings = { 'utf-16' },
    },
  },
  on_attach = function(client)
    -- Disable hover in favor of basedpyright
    client.server_capabilities.hoverProvider = false
  end,
}
