vim.o.autocomplete = false   -- blink handles this now
vim.o.completeopt  = 'menu,menuone,noselect'

-- still keep the iskeyword fix
vim.api.nvim_create_autocmd('FileType', {
  pattern  = 'clojure',
  callback = function()
    vim.bo.iskeyword = vim.bo.iskeyword .. ',/,-,?,!,+,=,<,>'
  end,
})
