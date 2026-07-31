return {
  {
    "nvim-mini/mini.pairs",
    opts = {
      skip_unbalanced = true,
    },

    -- Let strict-paredit control pairs in Clojure buffers.
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "clojure",
        callback = function()
          vim.b.minipairs_disable = true
        end,
      })
    end,
  },

  {
    "sundbp/strict-paredit.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "clojure" },
    opts = {
      filetypes = { "clojure" },
      notify = true,
    },
  },
}
