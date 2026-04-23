vim.pack.add({
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = 'main',
  },
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
    version = 'main',
  },
})

-- Treesitter config
local treesitter = require('nvim-treesitter')
local parsers = {
  'angular',
  'astro',
  'bash',
  'c',
  'cpp',
  'css',
  'dockerfile',
  'gitignore',
  'go',
  'graphql',
  'html',
  'java',
  'javascript',
  'json',
  'jsx',
  'lua',
  'markdown',
  'python',
  'regex',
  'ruby',
  'rust',
  'sql',
  'tmux',
  'toml',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
  'yaml',
  'zsh',
}

treesitter.install(parsers)

vim.api.nvim_create_autocmd('FileType', {
  pattern = parsers,
  callback = function()
    vim.treesitter.start()
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo.foldmethod = 'expr'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- Textobjects config
require('nvim-treesitter-textobjects').setup({
  select = {
    enable = true,
    lookahead = true,
    selection_modes = {
      ['@parameter.outer'] = 'v',
      ['@function.outer'] = 'V',
      ['@class.outer'] = '<c-v>',
    },
    include_surrounding_whitespace = false,
  },
  move = {
    enable = true,
    set_jumps = true,
  },
})

-- Keymaps
vim.keymap.set('n', '<leader>tu', '<cmd>TSUpdate<cr>', { desc = 'Update Treesitter Parsers' })

-- Select keymaps
local select = require('nvim-treesitter-textobjects.select')
local select_keymaps = {
  { { 'x', 'o' }, 'if', '@function.inner' },
  { { 'x', 'o' }, 'of', '@function.outer' },
  { { 'x', 'o' }, 'ip', '@parameter.inner' },
  { { 'x', 'o' }, 'op', '@parameter.outer' },
}

for _, v in ipairs(select_keymaps) do
  local modes, keys, command = v[1], v[2], v[3]
  vim.keymap.set(modes, keys, function()
    select.select_textobject(command, 'textobjects')
  end, { desc = 'Select ' .. command })
end

-- Move keymaps
local move = require('nvim-treesitter-textobjects.move')
local move_keymaps = {
  { { 'n', 'x', 'o' }, ']m', '@function.outer', move.goto_next_start },
  { { 'n', 'x', 'o' }, '[m', '@function.outer', move.goto_previous_start },
  { { 'n', 'x', 'o' }, ']M', '@function.outer', move.goto_next_end },
  { { 'n', 'x', 'o' }, '[M', '@function.outer', move.goto_previous_end },
  { { 'n', 'x', 'o' }, ']o', { '@loop.inner', '@loop.outer' }, move.goto_next_start },
  { { 'n', 'x', 'o' }, '[o', { '@loop.inner', '@loop.outer' }, move.goto_previous_start },
}

for _, v in ipairs(move_keymaps) do
  local modes, keys, command, func = v[1], v[2], v[3], v[4]
  local desc_string = (type(command) == 'table') and table.concat(command, ', ') or command
  vim.keymap.set(modes, keys, function()
    func(command, 'textobjects')
  end, { desc = 'Move to ' .. desc_string })
end
