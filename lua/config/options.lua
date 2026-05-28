vim.o.expandtab     = true
vim.o.tabstop       = 2
vim.o.softtabstop   = 2
vim.o.shiftwidth    = 2
vim.o.wrap          = false
vim.o.showmode      = false
vim.o.clipboard     = 'unnamedplus'
vim.o.mouse         = 'a'
vim.o.number        = true
vim.o.termguicolors = true
vim.o.cursorline    = true
vim.o.signcolumn    = 'yes'

vim.g.mapleader      = ' '
vim.g.maplocalleader = ','

vim.o.showmatch = true
vim.o.matchtime = 2
vim.o.undofile  = true
vim.o.undodir   = vim.fn.stdpath('data') .. '/undo'


vim.keymap.set('n', '<C-M-Space>', function()
  require('nvim-treesitter.incremental_selection').init_selection()
end, { desc = 'Start treesitter selection' })

vim.keymap.set('x', '<C-M-Space>', function()
  require('nvim-treesitter.incremental_selection').node_incremental()
end, { desc = 'Expand selection' })

vim.keymap.set('x', '<C-M-S-Space>', function()
  require('nvim-treesitter.incremental_selection').node_decremental()
end, { desc = 'Shrink selection' })
