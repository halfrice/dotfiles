vim.pack.add({ 'https://github.com/folke/tokyonight.nvim' })

require('tokyonight').setup({
  transparent = true,

  -- nvim-tree transparency fix
  styles = {
    sidebars = 'transparent',
  },

  -- Statusbar transparency fix
  on_colors = function(colors)
    colors.bg_statusline = colors.none
  end,
})

vim.cmd('colorscheme tokyonight-night')
