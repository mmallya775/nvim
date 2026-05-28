-- Using vim.pack
vim.pack.add({
  'https://github.com/catppuccin/nvim',
})

require('catppuccin').setup({
  flavour = 'mocha', -- latte, frappe, macchiato, mocha
  styles = {
    comments = { 'italic' },
    keywords = {},
  },
})

vim.cmd('colorscheme catppuccin')
