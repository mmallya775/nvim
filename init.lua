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
-- vim.cmd("set relativenumber")

vim.cmd("set termguicolors")
-- Remove the search highlight
vim.keymap.set("n", "<space><space>", ":nohlsearch<CR>")

vim.o.cursorline = true

-- Disable italics in floating docs
vim.api.nvim_set_hl(0, "LspMarkdownItalic", { italic = false })
vim.api.nvim_set_hl(0, "@markup.italic.markdown", { italic = false }) -- Treesitter
vim.api.nvim_set_hl(0, "markdownItalic", { italic = false }) -- Fallback

vim.api.nvim_set_hl(0, "@markup.raw.block.markdown", { italic = false })

---- Config part install
require("config.lazy")

vim.cmd([[
  highlight CursorLineNr guifg=#facf11 gui=bold
  highlight LineNr guifg=#808080
]])
