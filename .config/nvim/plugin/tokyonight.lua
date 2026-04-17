vim.pack.add({ 'https://github.com/folke/tokyonight.nvim' })

require('tokyonight').setup({
  transparent = true,

  -- nvim-tree transparency fix
  styles = {
    sidebars = 'transparent',
    floats = 'transparent',
  },

  on_highlights = function(highlight, colors)
    -- Darker CursorLine
    highlight.CursorLine = { bg = colors.bg_dark }
    highlight.Visual = { bg = colors.bg_dark }
  end,

  on_colors = function(colors)
    -- Lualine (statusbar) transparency fix
    colors.bg_statusline = colors.none
  end,
})

vim.cmd('colorscheme tokyonight-night')
