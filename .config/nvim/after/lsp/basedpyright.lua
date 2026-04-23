return {
  settings = {
    basedpyright = {
      analysis = {
        ignore = { '*' }, -- Use Ruff for linting
      },
      disableOrganizeImports = true, -- Use Ruff for import organization
      inlayHints = {
        callArgumentNames = true,
      },
    },
  },
}
