return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },

    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewFileHistory",
    },

    opts = {
      enhanced_diff_hl = true, -- better intra-line highlighting

      view = {
        default = {
          layout = "diff2_horizontal", -- side-by-side layout
          winbar_info = true,
        },
        merge_tool = {
          layout = "diff3_horizontal",
          disable_diagnostics = true,
          winbar_info = true,
        },
        file_history = {
          layout = "diff2_horizontal",
          winbar_info = true,
        },
      },

      file_panel = {
        listing_style = "tree",
        tree_options = {
          flatten_dirs = true,
          folder_statuses = "only_folded",
        },
        win_config = {
          position = "left",
          width = 35,
        },
      },
    },

    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Git Diff (Working Tree)" },
      { "<leader>gD", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "File History" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<CR>", desc = "Repo History" },
    },
  },
}

