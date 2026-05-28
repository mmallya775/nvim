local map = function(mode, k, v, desc)
  vim.keymap.set(mode, k, v, { desc = desc })
end

-- General
map('n', '<leader><leader>', ':nohlsearch<CR>',  'Clear search highlight')
map('n', '<leader>w',        ':w<CR>',           'Save')
map('n', '<leader>q',        ':bd<CR>',          'Close buffer')

-- Window navigation
map('n', '<C-h>', '<C-w>h', 'Move to left window')
map('n', '<C-l>', '<C-w>l', 'Move to right window')
map('n', '<C-j>', '<C-w>j', 'Move to lower window')
map('n', '<C-k>', '<C-w>k', 'Move to upper window')

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', 'Find files')
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>',  'Live grep')
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>',    'Buffers')
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>',  'Help tags')
vim.keymap.set('n', '<leader>ss', '<cmd>Telescope lsp_document_symbols<CR>',  { desc = 'LSP symbols' })
vim.keymap.set('n', '<leader>sS', '<cmd>Telescope lsp_workspace_symbols<CR>', { desc = 'LSP workspace symbols' })

map('n', '<leader>u', '<cmd>Undotree<CR>', 'Toggle undotree')
