vim.pack.add({
  'https://github.com/utilyre/barbecue.nvim',
  'https://github.com/SmiteshP/nvim-navic',
})

require('barbecue').setup({
  theme    = 'catppuccin',
  show_modified = true,
})
