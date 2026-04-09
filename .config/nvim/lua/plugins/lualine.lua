vim.pack.add({
  'https://github.com/nvim-lualine/lualine.nvim',
  -- Dependencies
  'https://github.com/nvim-tree/nvim-web-devicons',
})

require('lualine').setup({
  options = {
    globalstatus = true,
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { 'filename', path = 1 }, 'branch', 'diff', 'location', 'mode' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
})
