return {
  {
    "kristijanhusak/vim-dadbod-ui",

    dependencies = {
      "tpope/vim-dadbod",
    },

    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },

    keys = {
      {
        "<leader>Db",
        "<cmd>DBUIToggle<cr>",
        desc = "Database UI",
      },
      {
        "<leader>Da",
        "<cmd>DBUIAddConnection<cr>",
        desc = "Add database connection",
      },
      {
        "<leader>Df",
        "<cmd>DBUIFindBuffer<cr>",
        desc = "Find database buffer",
      },
      vim.keymap.set("n", "<leader>De", "<cmd>DB<cr>", {
        desc = "Execute SQL",
      }),

      vim.keymap.set("v", "<leader>De", ":DB<cr>", {
        desc = "Execute selected SQL",
      }),
    },

    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
}
