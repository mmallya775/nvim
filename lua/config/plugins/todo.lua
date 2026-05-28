vim.pack.add({
  'https://github.com/folke/todo-comments.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
})

require('todo-comments').setup({
  signs     = false,
  highlight = {
    keyword = 'bg',
    after   = 'fg',
  },
  keywords = {
    FIX  = { icon = '✘', color = 'error',   alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' } },
    TODO = { icon = '»', color = 'info' },
    HACK = { icon = '▲', color = 'warning' },
    WARN = { icon = '▲', color = 'warning', alt = { 'WARNING', 'XXX' } },
    NOTE = { icon = '●', color = 'hint',    alt = { 'INFO' } },
  },
})

vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<CR>', { desc = 'Find TODOs' })
vim.keymap.set('n', ']t', function() require('todo-comments').jump_next() end, { desc = 'Next TODO' })
vim.keymap.set('n', '[t', function() require('todo-comments').jump_prev() end, { desc = 'Prev TODO' })
