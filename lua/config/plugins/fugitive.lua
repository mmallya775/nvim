vim.pack.add({
  'https://github.com/tpope/vim-fugitive',
})

vim.keymap.set('n', '<leader>gf', '<cmd>Git<CR>',              { desc = 'Fugitive status' })
vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<CR>',       { desc = 'Git commit' })
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>',         { desc = 'Git push' })
vim.keymap.set('n', '<leader>gl', '<cmd>Git pull<CR>',         { desc = 'Git pull' })
vim.keymap.set('n', '<leader>gd', '<cmd>Gdiffsplit<CR>',       { desc = 'Git diff split' })
vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<CR>',        { desc = 'Git blame' })
vim.keymap.set('n', '<leader>gh', '<cmd>0Gclog<CR>',           { desc = 'File history' })
