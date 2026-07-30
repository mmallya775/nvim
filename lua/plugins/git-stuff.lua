return {
  -- Main Git interface
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",

    keys = {
      {
        "<leader>gg",
        "<cmd>Neogit<cr>",
        desc = "Neogit",
      },
      {
        "<leader>gs",
        "<cmd>Neogit<cr>",
        desc = "Git Status (Neogit)",
      },
    },

    opts = {
      kind = "tab",

      -- LazyVim already provides Snacks.
      integrations = {
        snacks = true,
      },
    },
  },

  -- Vim-native Git commands and full-file blame
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },

    keys = {
      {
        "<leader>gA",
        "<cmd>Git blame<cr>",
        desc = "Git Blame File",
      },
    },
  },

  -- Already installed by LazyVim.
  -- This only adds optional inline blame configuration.
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = false,
    },
  },
}
