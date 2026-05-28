-- lua/config/diagnostics.lua
local sev = vim.diagnostic.severity

vim.diagnostic.config({
  severity_sort = true,
  virtual_text  = {
    prefix = function(diagnostic)
      if diagnostic.severity == sev.ERROR then return '✘' end
      if diagnostic.severity == sev.WARN  then return '▲' end
      if diagnostic.severity == sev.INFO  then return '»' end
      if diagnostic.severity == sev.HINT  then return '󰌶' end
    end,
  },
  signs = {
    text = {
      [sev.ERROR] = '✘',
      [sev.WARN]  = '▲',
      [sev.INFO]  = '»',
      [sev.HINT]  = '󰌶',
    },
  },
  float = {
    border = 'rounded',
    source = true,
  },
})

vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})
