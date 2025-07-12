vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nowrap")

vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"

vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }

vim.cmd("set mouse=a")

vim.cmd("set number")
-- Remove the search highlight
vim.keymap.set("n", "<space><space>", ":nohlsearch<CR>")

---- Config part install
require("config.lazy")
