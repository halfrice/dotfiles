vim.pack.add({ 'https://github.com/folke/tokyonight.nvim' })

require('tokyonight').setup({
  transparent = true,

  -- nvim-tree transparency fix
  styles = {
    sidebars = 'transparent',
    floats = 'transparent',
  },

  -- Bufferline transparency fix
  on_highlights = function(highlight, colors)
    -- TabLineFill is defaulted to black. Set it to none
    highlight.TabLineFill = {
      bg = colors.none,
    }
  end,

  -- Lualine (statusbar) transparency fix
  on_colors = function(colors)
    colors.bg_statusline = colors.none
  end,
})

vim.cmd('colorscheme tokyonight-night')
