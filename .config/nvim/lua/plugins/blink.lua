vim.pack.add({
  {
    src = 'https://github.com/saghen/blink.cmp',
    version = vim.version.range('^1'),
  },
})

require('blink.cmp').setup({
  appearance = {
    nerd_font_variant = 'mono',
    use_nvim_cmp_as_default = true,
  },
  completion = { documentation = { auto_show = false } },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  keymap = {
    preset = 'super-tab',
    ['<c-k>'] = { 'select_prev', 'fallback' },
    ['<c-j>'] = { 'select_next', 'fallback' },
  },
  signature = { enabled = true },
  sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
})
