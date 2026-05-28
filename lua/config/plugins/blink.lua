vim.pack.add({
  { src = 'https://github.com/Saghen/blink.cmp', version = 'v1.10.2' },
})

local ok, blink = pcall(require, 'blink.cmp')
if not ok then return end

blink.setup({
  keymap = {
    preset  = 'default',
    ['<CR>']  = { 'accept', 'fallback' },
    ['<Tab>'] = { 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },
  },
  sources = {
    default = { 'lsp', 'buffer', 'path' },
  },
  completion = {
    menu = {
      border   = 'rounded',
      max_height = 10,
    },
    documentation = {
      auto_show = true,
      window    = { border = 'rounded' },
    },
  },
  signature = {
    enabled = true,   -- shows function signature while you type args
  },
})
