vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lualine/lualine.nvim',
})

local is_recording = function()
  local reg = vim.fn.reg_recording()
  if reg == '' then
    return ''
  end
  return 'RECORDING @' .. reg
end

require('lualine').setup({
  options = {
    globalstatus = true,
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      { 'filename', path = 1 },
      'branch',
      'diff',
      'venv-selector',
      'location',
      'searchcount',
      'mode',
      is_recording,
    },
    lualine_x = { 'diagnostics', 'lsp_status' },
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
