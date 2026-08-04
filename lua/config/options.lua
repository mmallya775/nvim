-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.fixendofline = false

-- Always open files with all folds expanded
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- Do not restore fold state from LazyVim sessions
vim.opt.sessionoptions:remove("folds")
