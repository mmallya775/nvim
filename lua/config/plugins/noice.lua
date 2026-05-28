vim.pack.add({
  'https://github.com/folke/noice.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/rcarriga/nvim-notify',
})

require('noice').setup({
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown']                = true,
      ['cmp.entry.get_documentation']                  = true,
    },
    signature = { enabled = false },  -- blink.cmp handles this
  },
  presets = {
    bottom_search         = true,   -- classic bottom search bar
    command_palette       = true,   -- cmdline and popupmenu together
    long_message_to_split = true,   -- long messages go to split
    inc_rename            = false,
  },
  messages = { enabled = true },
  notify   = { enabled = true },
  cmdline  = {
    enabled = true,
    view    = 'cmdline_popup',
    format  = {
      cmdline   = { icon = '>' },
      search_down = { icon = '/' },
      search_up   = { icon = '?' },
      filter      = { icon = '$' },
      lua         = { icon = 'λ' },
    },
  },
})
