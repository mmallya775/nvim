-- lua/config/plugins/neotree.lua
vim.pack.add({
  'https://github.com/nvim-neo-tree/neo-tree.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
})

require('neo-tree').setup({
  filesystem = {
    filtered_items = {
      visible = true,
    },
  },
  window = {
    position = 'left',
    mappings = {
      ['<Tab>'] = 'toggle_node',
    },
  },
})

vim.keymap.set('n', '<C-n>', ':Neotree toggle left reveal<CR>', { noremap = true, silent = true })
