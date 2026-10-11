-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileType", {
  pattern = "clojure",
  callback = function()
    vim.b.autoformat = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "NeogitCommitMessage" },
  callback = function()
    local o = vim.opt_local
    o.textwidth = 72
    o.colorcolumn = "51,73"
    o.expandtab = true
    o.shiftwidth = 2
    o.autoindent = true
    o.spell = true
    o.formatoptions:append("tqn")
    o.formatlistpat = [[^\s*\(\d\+[.)]\|[-*+]\)\s\+]]
  end,
})
