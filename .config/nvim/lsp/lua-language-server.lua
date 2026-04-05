return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = {
    '.emmyrc.json',
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
  },
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
      diagnostics = { globals = { 'vim' } }, -- Recognize 'vim' global
      format = { enable = false },
      telemetry = { enable = false },
      workspace = { checkThirdParty = false },
    },
  },
}
