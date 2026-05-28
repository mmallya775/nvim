-- lua/config/plugins/lualine.lua
vim.pack.add({
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
})
require('lualine').setup({
  options = {
    theme                = 'onedark',
    icons_enabled        = true,
    globalstatus         = true,   -- single statusline across all splits
    component_separators = { left = '', right = '' },
    section_separators   = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = {
      { 'branch', icon = '' },
      {
        'diff',
        symbols = { added = ' ', modified = ' ', removed = ' ' },
      },
    },
    lualine_c = {
      {
        'filename',
        path    = 1,          -- relative path
        symbols = { modified = '  ', readonly = '  ', unnamed = '  ' },
      },
    },
    lualine_x = {
      {
        'diagnostics',
        sources  = { 'nvim_diagnostic' },
        symbols = { error = '⊗ ', warn = '⚠ ', info = 'ⓘ ', hint = '○ ' },
      },
      {
        function()
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          if #clients == 0 then return '' end
          return ' ' .. clients[1].name
        end,
      },
    },
    lualine_y = { 'filetype' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
})
