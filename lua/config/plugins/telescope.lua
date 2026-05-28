vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
})

vim.api.nvim_create_autocmd('User', {
  pattern  = 'PackLoaded',
  once     = true,
  callback = function()
    local ok, telescope = pcall(require, 'telescope')
    if not ok then return end

    telescope.setup({
      defaults = {
        layout_strategy  = 'horizontal',
        sorting_strategy = 'ascending',
        layout_config    = { prompt_position = 'top' },
        file_ignore_patterns = { '.git/', 'node_modules/', 'target/' },
      },
    })
  end,
})
