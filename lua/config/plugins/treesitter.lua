
-- lua/config/treesitter.lua

vim.api.nvim_create_autocmd('FileType', {
  pattern  = 'clojure',
  callback = function(ev)
    vim.treesitter.start(ev.buf, 'clojure')
  end,
})
