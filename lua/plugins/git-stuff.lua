return {
  -- Diff and merge-conflict viewer
  {
    "sindrets/diffview.nvim",

    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewRefresh",
      "DiffviewFileHistory",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
    },

    keys = {
      {
        "<leader>gd",
        "<cmd>DiffviewOpen<cr>",
        desc = "Git Diff View",
      },
      {
        "<leader>gh",
        "<cmd>DiffviewFileHistory %<cr>",
        desc = "Git File History",
      },
    },

    opts = function()
      local actions = require("diffview.actions")

      return {
        view = {
          merge_tool = {
            layout = "diff3_horizontal",
            disable_diagnostics = true,
            winbar_info = true,
          },
        },

        keymaps = {
          -- Mappings active inside the diff/result windows.
          view = {
            -- Disable Diffview's default conflict-selection mappings.
            -- [x and ]x remain unchanged for conflict navigation.
            ["<leader>co"] = false,
            ["<leader>ct"] = false,
            ["<leader>cb"] = false,
            ["<leader>ca"] = false,
            ["dx"] = false,

            ["<leader>cO"] = false,
            ["<leader>cT"] = false,
            ["<leader>cB"] = false,
            ["<leader>cA"] = false,
            ["dX"] = false,

            -- Resolve the conflict under the cursor.
            {
              "n",
              "<leader>gco",
              actions.conflict_choose("ours"),
              { desc = "Git Conflict: Choose Ours" },
            },
            {
              "n",
              "<leader>gct",
              actions.conflict_choose("theirs"),
              { desc = "Git Conflict: Choose Theirs" },
            },
            {
              "n",
              "<leader>gcb",
              actions.conflict_choose("base"),
              { desc = "Git Conflict: Choose Base" },
            },
            {
              "n",
              "<leader>gca",
              actions.conflict_choose("all"),
              { desc = "Git Conflict: Keep Both" },
            },
            {
              "n",
              "<leader>gcx",
              actions.conflict_choose("none"),
              { desc = "Git Conflict: Remove Both" },
            },

            -- Resolve every conflict in the current file.
            {
              "n",
              "<leader>gcfo",
              actions.conflict_choose_all("ours"),
              { desc = "Git Conflict File: Choose Ours" },
            },
            {
              "n",
              "<leader>gcft",
              actions.conflict_choose_all("theirs"),
              { desc = "Git Conflict File: Choose Theirs" },
            },
            {
              "n",
              "<leader>gcfb",
              actions.conflict_choose_all("base"),
              { desc = "Git Conflict File: Choose Base" },
            },
            {
              "n",
              "<leader>gcfa",
              actions.conflict_choose_all("all"),
              { desc = "Git Conflict File: Keep Both" },
            },
            {
              "n",
              "<leader>gcfx",
              actions.conflict_choose_all("none"),
              { desc = "Git Conflict File: Remove Both" },
            },
          },

          -- Mappings active while the cursor is in Diffview's file panel.
          file_panel = {
            -- Disable only the default whole-file conflict mappings.
            -- [x and ]x remain unchanged.
            ["<leader>cO"] = false,
            ["<leader>cT"] = false,
            ["<leader>cB"] = false,
            ["<leader>cA"] = false,
            ["dX"] = false,

            {
              "n",
              "<leader>gcfo",
              actions.conflict_choose_all("ours"),
              { desc = "Git Conflict File: Choose Ours" },
            },
            {
              "n",
              "<leader>gcft",
              actions.conflict_choose_all("theirs"),
              { desc = "Git Conflict File: Choose Theirs" },
            },
            {
              "n",
              "<leader>gcfb",
              actions.conflict_choose_all("base"),
              { desc = "Git Conflict File: Choose Base" },
            },
            {
              "n",
              "<leader>gcfa",
              actions.conflict_choose_all("all"),
              { desc = "Git Conflict File: Keep Both" },
            },
            {
              "n",
              "<leader>gcfx",
              actions.conflict_choose_all("none"),
              { desc = "Git Conflict File: Remove Both" },
            },
          },
        },
      }
    end,
  },

  -- Main Git interface
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",

    dependencies = {
      "sindrets/diffview.nvim",
    },

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

      integrations = {
        snacks = true,
        diffview = true,
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

  -- Inline blame
  {
    "lewis6991/gitsigns.nvim",

    opts = {
      current_line_blame = true,
    },
  },
}
