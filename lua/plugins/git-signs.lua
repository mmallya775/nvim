return {
  "airblade/vim-gitgutter",
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    -- Update signs faster (default is 4000ms)
    vim.g.gitgutter_map_keys = 0 -- Disable default mappings, we define our own
    vim.g.updatetime = 100
  end,
  keys = {
    { "]h", "<Plug>(GitGutterNextHunk)", desc = "Next hunk" },
    { "[h", "<Plug>(GitGutterPrevHunk)", desc = "Previous hunk" },
    { "<leader>hs", "<Plug>(GitGutterStageHunk)", desc = "Stage hunk" },
    { "<leader>hu", "<Plug>(GitGutterUndoHunk)", desc = "Undo hunk" },
    { "<leader>hp", "<Plug>(GitGutterPreviewHunk)", desc = "Preview hunk" },
    { "<leader>tb", "<cmd>GitGutterLineHighlightsToggle<cr>", desc = "Toggle line highlights" },
  },
}
