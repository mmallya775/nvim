vim.pack.add({
  'https://github.com/folke/which-key.nvim',
})

require('which-key').setup({
  delay = 300,
  icons = { enabled = false },
  spec = {
    { '<leader>f', group = 'Find' },
    { '<leader>g', group = 'Git' },
    { '<leader>c', group = 'Code' },
    { '<leader>e', desc  = 'File tree' },
    { '<leader>w', desc  = 'Save' },
    { '<leader>q', desc  = 'Close buffer' },
  },
})
