-- return {
--   "airblade/vim-gitgutter",
--   event = { "BufReadPre", "BufNewFile" },
--   init = function()
--     -- Update signs faster (default is 4000ms)
--     vim.g.gitgutter_map_keys = 0 -- Disable default mappings, we define our own
--     vim.g.updatetime = 100
--   end,
--   keys = {
--     { "]h", "<Plug>(GitGutterNextHunk)", desc = "Next hunk" },
--     { "[h", "<Plug>(GitGutterPrevHunk)", desc = "Previous hunk" },
--     { "<leader>hs", "<Plug>(GitGutterStageHunk)", desc = "Stage hunk" },
--     { "<leader>hu", "<Plug>(GitGutterUndoHunk)", desc = "Undo hunk" },
--     { "<leader>hp", "<Plug>(GitGutterPreviewHunk)", desc = "Preview hunk" },
--     { "<leader>tb", "<cmd>GitGutterLineHighlightsToggle<cr>", desc = "Toggle line highlights" },
--   },
-- }
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- This enables the "ghost text" blame at the end of the line
    current_line_blame = true, 
    current_line_blame_opts = {
      delay = 500, -- Delay in ms before blame appears
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation (Replacing your GitGutter maps)
      map('n', ']h', function() gs.nav_hunk('next') end, { desc = "Next hunk" })
      map('n', '[h', function() gs.nav_hunk('prev') end, { desc = "Prev hunk" })

      -- Actions
      map('n', '<leader>hs', gs.stage_hunk, { desc = "Stage hunk" })
      map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "Undo hunk" })
      map('n', '<leader>hp', gs.preview_hunk, { desc = "Preview hunk" })
      map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = "Blame full line" })
      map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "Toggle inline blame" })
    end
  }
}
