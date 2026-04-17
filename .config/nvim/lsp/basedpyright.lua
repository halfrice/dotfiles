return {
  settings = {
    basedpyright = {
      -- Use Ruff's linter
      analysis = {
        ignore = { '*' },
      },
      diagnosticMode = 'openFilesOnly',
      -- Use Ruff's import organizer
      disableOrganizeImports = true,
      inlayHints = {
        callArgumentNames = true,
      },
    },
  },
}
