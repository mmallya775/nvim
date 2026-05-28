-- lua/config/plugins/neogit.lua
vim.pack.add({
  'https://github.com/NeogitOrg/neogit',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/sindrets/diffview.nvim',  -- optional but makes diffs much better
})

require('neogit').setup({
  integrations = {
    diffview = true,
  },
})

vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<CR>', { desc = 'Open Neogit' })
