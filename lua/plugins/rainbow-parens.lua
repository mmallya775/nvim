return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("rainbow-delimiters.setup").setup({
        -- Enable only for buffers using the Clojure Tree-sitter parser.
        whitelist = { "clojure" },
      })
    end,
  },
}
