return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      picker = {
        enabled = true,
        -- Retaining your ignore patterns
        exclude = { "node_modules", "target" },
      },
      -- This replaces telescope-ui-select
      input = { enabled = true },
      select = { enabled = true },
    },
    keys = {
      -- 1. Find Files (was <C-p>)
      { "<C-p>", function() Snacks.picker.files() end, desc = "Find Files" },
      
      -- 2. Live Grep (replaces live_grep_args)
      -- In Snacks, you can just type your args (like -g *.lua) directly in the picker
      { "<leader>fg", function() Snacks.picker.grep() end, desc = "Live Grep" },
      
      -- 3. Resume (was <leader>ff)
      { "<leader>ff", function() Snacks.picker.resume() end, desc = "Resume Last Picker" },
      
      -- 4. Buffers (was <leader>fb)
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      
      -- 5. Help Tags (was <leader>fh)
      { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
      
      -- 6. LSP References (was <leader>gr / <leader>fr)
      { "<leader>gr", function() Snacks.picker.lsp_references() end, desc = "LSP References" },
      { "<leader>fr", function() Snacks.picker.lsp_references() end, desc = "LSP References" },
      
      -- 7. Document Symbols (was <leader>ds)
      { "<leader>ds", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      
      -- 8. Code Lens (LSP remains a vim.lsp call, but Snacks can trigger it)
      { "<leader>cl", function() vim.lsp.codelens.run() end, desc = "Run CodeLens" },

      -- Git snacks pickers
      -- Add these to your Snacks.nvim keys table
{ "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
{ "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    },
  },
}
